Rails.application.routes.draw do

  get 'users/new', to:'users#new', as:'users_new'

  get 'users/show'
  
  root 'reserves#index'
  get 'reserves/index'

  get 'reserves/show'

  get 'reserves/edit'

  get 'reserves/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
