require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
   test "should not save rating without integer value" do
    rating = Rating.new
    assert = !rating.save, "Saved restaurant without a title"
  end


  test "should not register incomplete rating to db" do
  	post :create, {:restaurant_id => 1, :rating => 1 }
  	assert_not_equal flash[:notice], "Your rating has been saved"
  	assert_response 302 #for now!
  end

end
