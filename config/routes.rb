Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#ghcreate'

  resources :adventures
  # resources :locations
  resources :users

  #nested
  resources :locations, only: [:index, :show, :new, :create] do
    resources :adventures, only: [:index, :new, :create, :show, :edit]
    # resources :categories
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
