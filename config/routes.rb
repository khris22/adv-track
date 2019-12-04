Rails.application.routes.draw do

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :adventures
  resources :locations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
