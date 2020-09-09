Rails.application.routes.draw do

  resources :events
  get 'users/new', to:'users#new', as:'new_users'
  post 'users/create', to:'users#create', as:'create_users'

  get 'users/show'
  
  root 'reserves#index'
  get 'reserves/index'

  get 'reserves/show'

  get 'reserves/edit'

  get 'reserves/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
