class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    
    @rating = Rating.new(params[:rating])
    @rating.restaurant_id = @restaurant.id
    @rating.user_id = current_user.id
    respond_to do |format|
      if @rating.save
        format.html { redirect_to restaurant_path(@restaurant), :notice => "Your rating has been saved" }
        format.js
      else
        format.html { redirect_to restaurant_path(@restaurant), :alert => "Your rating has not been saved" }
        format.js
      end
    end
  end

  def update
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @rating = current_user.ratings.find_by_restaurant_id(@restaurant.id)
    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to restaurant_path(@restaurant), :notice => "Your rating has been updated" }
        format.js
      else
        format.html { redirect_to restaurant_path(@restaurant), :alert => "Your rating has not been updated" }
        format.js
      end
    end
  end

end
