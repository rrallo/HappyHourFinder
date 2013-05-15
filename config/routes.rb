Happy::Application.routes.draw do
  devise_for :users

  get "restaurants/show"

	resources :restaurants
	root :to => redirect("/restaurants")
	match '/auth/:provider/callback' => 'authentications#create'

end
