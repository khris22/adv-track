Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#ghcreate'

  #nested routes
  # resources :adventures do
  #   resources :locations
  #   resources :categories
  # end

  resources :locations do
    resources :adventures, only: [:index, :new, :create, :show]
    # resources :categories
  end
  


  resources :adventures
  resources :locations
  resources :users



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
