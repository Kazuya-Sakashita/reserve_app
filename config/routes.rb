Rails.application.routes.draw do
  root 'reserves#index'
  resources :events
  get 'users/new', to:'users#new', as:'new_users'
  post 'users/create', to:'users#create', as:'create_users'

  get 'users/show/:id', to: 'users#show', as: 'users_show'

  get 'login', to: "sessions#new",as: "login"
  post 'login', to: "sessions#create"

  get 'reserves/show'

  get 'reserves/edit'

  get 'reserves/new'

  
  get 'logout', to:"sessions#destroy",as: "logout"


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
