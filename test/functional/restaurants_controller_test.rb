require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

  test "should show with id 1" do
    get :show , { :id => 1}
    @r1 =  assigns(:restaurant)
    assert_not_nil @r1
    assert_not_nil assigns(:restaurant)
    assert_response :success
  end

  test "should show all on empty search" do
    get :index, {:search => ""}
    assert_equal assigns(:restaurant_results), assigns(:restaurants)
    assert_response :success
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

  test "restaurant search rest1" do
    get( :index, { :search => "rest1"}, nil, nil)
  	@r1 = assigns(:restaurant_results)
    assert_not_equal @r1.count, 0
  end

  test "yelp_id's should be assigned" do  
    get :show, {:id => 1} 
    assert_not_nil assigns(:restaurant).yelp_id
    assert_response :success

    get :show, {:id => 2} 
    assert_not_nil assigns(:restaurant).yelp_id
    assert_response :success

    get :show, {:id => 3} 
    assert_not_nil assigns(:restaurant).yelp_id
    assert_response :success
  end

  
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
