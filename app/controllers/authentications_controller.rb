class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']

    # Try to find authentications first
    authentication = Authentication.find_by_uid(auth['uid'])

    if authentication.nil?
      # Authentication not found, thus a new user.
      user = User.new
      user.update_fields(auth)
      if user.save(:validate => false)
        flash[:notice] = 'Account created and signed in successfully.'
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = 'Error while creating a user account. Please try again.'
        redirect_to root_url
      end
    else
      # Authentication found, sign the user in.
      flash[:notice] = 'Signed in successfully.'

      # Update information.
      user = User.find(authentication.user_id)
      user.update_fields(auth)

      sign_in_and_redirect(:user, user)
    end
  end
end
