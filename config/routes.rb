Happy::Application.routes.draw do
  resources :categories

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "restaurants/show"

	resources :restaurants 
  resources :ratings

	root :to => redirect("/restaurants")
	match '/auth/:provider/callback' => 'authentications#create'

end
