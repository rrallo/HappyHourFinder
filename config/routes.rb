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

  get '/new_restaurant_request' => 'restaurants#new_request'
  post '/new_restaurant_request' => 'restaurants#create_request'

  post '/make_admin' => 'restaurants#make_admin'
  get '/demote_admin' => 'restaurants#demote_admin'
  post '/demote_admin' => 'restaurants#demote_admin'
  match '/review_restaurant_requests' => 'restaurants#review_requests'

  post '/approve_request' => 'restaurants#approve_request'
  post '/delete_request' => 'restaurants#delete_request'
  post '/disapprove_restaurant' => 'restaurants#disapprove_restaurant'
end
