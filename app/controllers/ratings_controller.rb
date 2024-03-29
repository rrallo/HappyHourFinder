class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    
    @rating = Rating.new
    @rating.rating = params[:rating]
    @rating.restaurant_id = @restaurant.id
    @rating.user_id = current_user.id
    respond_to do |format|
      if @rating.save
        format.html { redirect_to restaurant_path(@restaurant), :notice => "Your rating has been saved" }
        format.js
      else
        format.html { redirect_to restaurant_path(@restaurant), :alert => "Sorry, your rating was not saved" }
        format.js
      end
    end
  end

  def update
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @rating = current_user.ratings.find_by_restaurant_id(@restaurant.id)
    respond_to do |format|
      if @rating.update_attributes(rating: params[:rating])
        format.html { redirect_to restaurant_path(@restaurant), :notice => "Your rating has been updated"}
        format.js
      else
        format.html { redirect_to restaurant_path(@restaurant), :alert => "Sorry, your rating was not updated"}
        format.js
      end
    end
  end

end
