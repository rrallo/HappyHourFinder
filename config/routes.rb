Happy::Application.routes.draw do
  get "restaurants/show"

	resources :restaurants
  	root :to => redirect("/restaurants")

end
