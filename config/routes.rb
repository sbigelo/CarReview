Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  delete '/logout' => 'sessions#destroy'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :reviews do
    resources :comments
  end
  
  # resources :cars
  resources :comments
  resources :users do 
    resources :reviews, shallow: true
  end



  
end
