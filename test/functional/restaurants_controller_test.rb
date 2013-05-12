require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
