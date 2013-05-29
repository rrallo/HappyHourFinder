require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase
    test "test new user" do

	    OmniAuth.config.test_mode = true
	    
	    # puts OmniAuth.config.mock_auth[:facebook] 
	    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 

    	get :create, {:provider => "facebook", :token => "ABCDEF", :uid => 1234567, :user_id => 1}
    	assert_response 302
        assert_equal flash[:notice], "Account created and signed in successfully."
    end

    test "sign in with existing user" do
        OmniAuth.config.test_mode = true
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook2] 
        A = Authentication.create :provider => "SomeProvider", :uid => 1
        A.save

        get :create, {:provider => "SomeProvider", :token => "ABCDEF", :uid => 1, :user_id => 1}
        assert_response 302

        assert_equal flash[:notice], "Signed in successfully."
        A.destroy
    end

    test "should redirect to root from nil auth" do

        OmniAuth.config.test_mode = true
        request.env["omniauth.auth"] = nil
        get :create, {:provider => "me", :token => "you", :uid => 1, :user_id => 1}
        assert_response 302
        assert_equal flash[:error], "Could not sign in, please notify developers"

    end


end

