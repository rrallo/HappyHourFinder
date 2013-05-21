require 'rubygems'
require 'oauth'

class RestaurantsController < ApplicationController
	def index
	    if params[:search]
	      @restaurant_results = Restaurant.search(params[:search])
	      params[:search] = nil
	    end

	    @restaurants = Restaurant.all
	    @list = {}
	    @restaurants.each do |r|
	    	yelp = connectYelp r
	    	@list[r.name] = yelp["image_url"].gsub("ms\.jpg", "ls.jpg")
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
end
