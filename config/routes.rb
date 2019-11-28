Rails.application.routes.draw do
  get 'users/show', to: 'users#show'
 	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root to: "items#index"


  devise_for :users
  resources :carts, :path => "mon_panier"
 	resources :items
 	resources :charges, :path => "paiment"
  resources :orders, :path => "ma_commande"
  resources :cart_contents, only: [:create, :destroy]
end

# namespace :admin do
# resources :articles
# end
