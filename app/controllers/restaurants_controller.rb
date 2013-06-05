require 'rubygems'
require 'oauth'
require 'fb_graph'

class RestaurantsController < ApplicationController
  def index
    if params[:search]
      @restaurants = Restaurant.search(params[:search])
      params[:search] = nil
    end

    if @restaurants.nil? or @restaurants.empty?
      @restaurants = Restaurant.all
    end

    @list = {}
    @restaurants.each do |r|
      yelp = connectYelp r
      @list[r.name] = yelp["image_url"].gsub("ms\.jpg", "ls.jpg")
    end
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html
      format.json { render json: @restaurant }
    end
  end

  def create
    @restaurant = Restaurant.new(params[:id])
    @restaurant.is_approved = true

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
		@restaurant = Restaurant.find(params[:id])
		@yelp = connectYelp @restaurant
    @review = Review.new
    @header_img = @restaurant.photo_url
    #puts y @restaurant
  end

  def random
    @restaurant = Restaurant.offset(rand(Restaurant.count)).first
    @yelp = connectYelp @restaurant
    @review = Review.new
    @header_img = @restaurant.photo_url

    redirect_to @restaurant
  end

  def connectYelp restaurant
    consumer_key = 'ln-FI2hVPWjx4xFhWM5fGw'
    consumer_secret = 'QVauHsbQnYGdNoMMf5tRyw3doFk'
    token = 'fuh6R4C4UvSpbUbSNuVZWGZxpTzqb8iU'
    token_secret = '7aBPLXymeigPDcVZiszOl6DT_Ts'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		path = "/v2/business/" + restaurant.yelp_id

		p = access_token.get(path).body
		ActiveSupport::JSON.decode(p)
	end

  def share_link
    @restaurant = Restaurant.find(params[:id])
    user = FbGraph::User.me current_user.authentications.first.token
    site = "https://shielded-hollows-4431.herokuapp.com#{params[:link]}"
    begin
      user.link!(link: site, message: "Check out the happy hours of #{@restaurant.name}!")
      respond_to do |format|
        format.html { redirect_to @restaurant, notice: "You have posted a link to #{site} on Facebook" }
        format.json { render json: @restaurant }
      end
    rescue
      respond_to do |format|
        format.html { redirect_to @restaurant, alert: "An error occurred when posting the link to #{site} on Facebook" }
        format.json { render json: @restaurant }
      end
    end
  end

  def new_request
    respond_to do |format|
      format.html
    end
  end

  def create_request
    @restaurant = Restaurant.new
    @restaurant.name        = params[:name]
    @restaurant.location    = params[:location]
    @restaurant.yelp_id     = params[:yelp_id]
    @restaurant.photo_url   = params[:photo_url]
    @restaurant.is_approved = false

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully added for review.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { redirect_to @restaurant, alert: 'Restaurant was not successfully added for review.' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def make_admin
    if params[:passphrase].downcase == "barrater"
      current_user.is_admin = true

      respond_to do |format|
        if current_user.save
          format.html { redirect_to :back, notice: 'You are now an admin.' }
        else
          format.html { redirect_to :back, alert: 'There was an error. Please contact an admin.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: 'Incorrect password.' }
      end
    end
  end

  def demote_admin
    if current_user.admin?
      current_user.is_admin = false

      respond_to do |format|
        if current_user.save
          format.html { redirect_to :back, notice: 'You are now a regular user.' }
        else
          format.html { redirect_to :back, alert: 'There was an error.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: 'You are not an admin.' }
      end
    end
  end

  def review_requests
    if params[:search]
      @restaurants = Restaurant.search(params[:search])
      params[:search] = nil
    end

    if @restaurants.nil? or @restaurants.empty?
      @restaurants = Restaurant.all
    end

    @list = {}
    @restaurants.each do |r|
      yelp = connectYelp r
      @list[r.name] = yelp["image_url"].gsub("ms\.jpg", "ls.jpg")
    end
  end

  def approve_request
    @restaurant = Restaurant.find(params[:form][:id])
    @restaurant.is_approved = true

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to :back, notice: 'The restaurant has been approved.' }
      else
        format.html { redirect_to :back, alert: 'The restaurant has not been approved.' }
      end
    end
  end

  def delete_request
    @restaurant = Restaurant.find(params[:form][:id])
    @restaurant.destroy

    respond_to do |format|
      if @restaurant.destroyed?
        format.html { redirect_to :back, notice: 'The restaurant has been deleted from the review list.' }
      else
        format.html { redirect_to :back, alert: 'The restaurant has not been deleted from the review list due to an internal error.' }
      end
    end
  end

  def disapprove_restaurant
    @restaurant = Restaurant.find(params[:form][:id])
    @restaurant.is_approved = false

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to :back, notice: 'The restaurant has been put on list of restaurants to be reviewed.' }
      else
        format.html { redirect_to :back, alert: 'The restaurant status has not been changed due to internal error.' }
      end
    end
  end
end
