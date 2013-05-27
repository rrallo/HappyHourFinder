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
    @header_img = @restaurant.name.downcase.tr(" ", "_") + ".jpg"
  end

  def connectYelp restaurant
    consumer_key = 'ln-FI2hVPWjx4xFhWM5fGw'
    consumer_secret = 'QVauHsbQnYGdNoMMf5tRyw3doFk'
    token = 'LAZBDQVnH-ZmlFa0U15jcWcTTbayNE_y'
    token_secret = 'iPGhsMEKy-WmU-kK24bwxpryagM'

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/business/" + restaurant.yelp_id

    p = access_token.get(path).body
    ActiveSupport::JSON.decode(p)
  end

  def share_link
    @restaurant = Restaurant.find(params[:id])
    user = FbGraph::User.me current_user.authentication.token
    site = "https://shielded-hollows-4431.herokuapp.com#{params[:link]}"
    #begin
      user.link!(link: site, message: 'Check out the happy hours of this restaurant! (testing cse 112 app)')
      respond_to do |format|
        format.html { redirect_to @restaurant, notice: "You have posted a link to #{site}" }
        format.json { render json: @restaurant }
      end
    #rescue
    #  respond_to do |format|
    #    format.html { redirect_to @restaurant, alert: "An error occurred when posting the link to #{site}" }
    #    format.json { render json: @restaurant }
    #  end
    #end
  end
end
