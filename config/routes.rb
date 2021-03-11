Rails.application.routes.draw do
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  
  
  # resources :cars
  resources :comments
  resources :users
  resources :reviews
  
end
