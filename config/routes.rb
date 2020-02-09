Rails.application.routes.draw do
  resources :taskfeeds
  resources :nagfeeds
  resources :groups
  resources :nags
  resources :tasks
  resources :users
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
