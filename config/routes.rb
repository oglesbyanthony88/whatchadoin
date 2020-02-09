Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #logout
  delete '/logout' => 'sessions#destroy'


  resources :taskfeeds
  resources :nagfeeds
  resources :groups
  resources :nags
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
