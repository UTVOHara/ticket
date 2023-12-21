Rails.application.routes.draw do
  resources :ticks
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/home/profile', to: 'home#profile'
  resources :carts
  get 'cart/show', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  # Defines the root path route ("/")
  # root "articles#index"
end
