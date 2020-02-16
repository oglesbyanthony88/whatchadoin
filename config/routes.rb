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


  
resources :users
resources :tasks
resources :nags
resources :groups
resources :admins

resources :groups do
  resources :tasks, only: [:index]
  resources :nags, only: [:index]
end

resources :admins do
  resources :groups, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :create, :update, :edit, :index]
  resources :tasks, only: [:new, :create, :index]
  resources :nags, only: [:new, :create, :update, :edit, :index]
end

resources :users do
  resources :nags, only: [:new, :create, :update, :edit, :index]
  resources :tasks, only: [:index]
  resources :groups, only: [:show]
end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



# admins/:id/groups/new/edit
# admins/:id/tasks/new/edit
# admins/:id/nags/new/edit
# admins/:id/users/new/edit


