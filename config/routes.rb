Rails.application.routes.draw do
  get 'users/show'
 	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root to: "items#index"
  devise_for :users
  resources :carts
 	resources :items do
 		resources :pictures, only: [:create]
 	end
 	resources :charges
  resources :orders
  resources :cart_contents, only: [:create, :destroy]
end
