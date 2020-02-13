Rails.application.routes.draw do

  root 'sessions#home'

  #OAUTH CALLBACK
  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/signup' => 'admins#new'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #admin login
  get '/adminlogin' => 'sessions#new_admin'
  post '/adminlogin' => 'sessions#admin_create'

  #logout
  delete '/logout' => 'sessions#destroy'

  #admin routes
  


  resources :admins
  resources :groups
  resources :nags
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
