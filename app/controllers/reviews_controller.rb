class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])

    @review = Review.new
    @review.review = params[:review][:review]
    @review.restaurant_id = @restaurant.id
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant), :notice => "Your review has been saved" }
        format.js
      else
        format.html { redirect_to restaurant_path(@restaurant), :alert => "Your rating has not been saved" }
        format.js
      end
    end
  end
  
end
