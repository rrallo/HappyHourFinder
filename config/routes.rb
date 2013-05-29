Happy::Application.routes.draw do
  ActiveSupport::Deprecation.silence do
    devise_for :users do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  end

  #get "restaurants/show"

	resources :restaurants 
  resources :ratings
  resources :reviews
  resources :home

	root :to => redirect("/restaurants")
	match '/auth/:provider/callback' => 'authentications#create'
  match '/restaurants/share_link/:id' => 'restaurants#share_link'

end
