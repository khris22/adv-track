Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#create'

  #nested routes
  resources :users do
    resources :adventures
    resources :locations
  end


  resources :adventures
  resources :locations
  resources :users



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
