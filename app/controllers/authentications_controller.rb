 class AuthenticationsController < ApplicationController
  def create

    auth = request.env["omniauth.auth"]

    # Check to see that auth exists. 
    # This would be a nil exception eventually!

    if auth == nil
      puts "auth is nil"
      flash[:error] = "Could not sign in, please notify developers"
      redirect_to "/restaurants"
    else 
      # Try to find authentications first
      authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

      if authentication

        # Authentication found, sign the user in.
        flash[:notice] = "Signed in successfully."

        # Update information.
        authentication.user.update_fields(auth)

        sign_in_and_redirect(:user, authentication.user)
      else
        # Authentication not found, thus a new user.
        user = User.new
        user.update_fields(auth)
        if user.save(:validate => false)
          flash[:notice] = "Account created and signed in successfully."
          sign_in_and_redirect(:user, user)
        else
          flash[:error] = "Error while creating a user account. Please try again."
          redirect_to root_url
        end
      end
    end
  end

end
