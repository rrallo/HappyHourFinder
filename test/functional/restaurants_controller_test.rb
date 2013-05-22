require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get show" do
=begin
    post :create,
         :restaurant => {:id => 3,
                         :name => "South Beach Bar & Grill",
                         :location => "Ocean Beach",
                         :photos_id => 3,
                         :rating => 3,
                         :yelp_id => 3}

     get(:show, {:id => 3})
=end
    assert_response :success
  end
end