Rails.application.routes.draw do
  resources :cars
  resources :comments
  resources :users
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
