Happy::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #get "restaurants/show"

	resources :restaurants 
  resources :ratings
  resources :home

	root :to => redirect("/restaurants")
	match '/auth/:provider/callback' => 'authentications#create'

end
