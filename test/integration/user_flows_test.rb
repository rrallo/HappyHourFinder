require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "browse a restaurant" do
    get "/restaurants"
    assert_response :success


    get restaurant_path(restaurants(:one))
    assert_response :success
    assert_equal "/restaurants/#{restaurants(:one).id}", path
    
  end

  test "browse a random restaurant" do
    get_via_redirect "/"
    assert_response :success
    assert_equal "/restaurants", path

    get_via_redirect "/random"
    assert_response :success
  end

  test "login and logout" do
    OmniAuth.config.test_mode = true
    
    get_via_redirect "/"
    assert_response :success
    assert_equal "/restaurants", path

    post_via_redirect "/auth/facebook", :email => "bob@example.com", :password => "qwerty"
    assert_response :success
    assert_equal "/restaurants", path


    get restaurant_path(restaurants(:one))
    assert_response :success
    assert_equal restaurant_path(restaurants(:one)), path

    get_via_redirect "/users/sign_out"
    assert_response :success
    assert_equal "/restaurants", path
  end
end
