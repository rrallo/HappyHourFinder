require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should show with any id" do
    get :show , { :id => 1}
    # @r1 =  assigns(:restaurant)
    # print @r1
    # assert_not_nil @r1
    # assert_not_nil assigns(:restaurant)
    # assert_response :success
  end

  test "results should not be nil" do
  	get :index
  	assert_not_nil assigns(:restaurants) , "restaurants var assigned?"
  	assert_response :success, "response successful?"
  end

  test "restaurants.count should > 0" do
  	get :index
    assert_not_equal assigns(:restaurants), 0
  	assert_response :success
  end

  test "restaurant search test1" do
  	post(:index, {'search' => "sea"}, nil, nil)
  	@r1 = assigns(:restaurant_results)
  	printf "  -- %d ===", @r1.count
  	print @r1
  end

  

end
