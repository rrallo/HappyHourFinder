class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_url

  #redirecting the herokuapp and www version of domain
  def check_url
    url = request.url
    if url.include?('appname.herokuapp.com')
      redirect_to ('http://domain.com')
    elsif url.include?('www.domain.com')
      redirect_to ('http://domain.com')        
    end    
  end
end
