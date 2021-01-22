Rails.application.routes.draw do
  root 'reserves#index'
  resources :events

  namespace :admin do
    resources :users
    resources :plans
    resources :boards
    resources :staffs, only: [:index, :new, :create, :show,  :edit, :destroy, :update,]
    resources :holidays, only: [:index, :new, :create, :show,  :edit, :destroy]
  end

# 会員情報登録
  get 'users/new', to:'users#new', as:'new_users'
  post 'users/create', to:'users#create', as:'create_users'
  get 'users/show/:id', to: 'users#show', as: 'users_show'


#　ユーザーログイン・ログアウト
  get 'login', to: "sessions#new",as: "login"
  post 'login', to: "sessions#create"
  get 'logout', to:"sessions#destroy",as: "logout"

# 予約テーブル
  get '/users/:users_id/reserves/step1', to:"reserves#step1", as:"step1_reserves"
  get '/users/:users_id/reserves/step2', to:"reserves#step2", as:"step2_reserves"
  get '/users/:users_id/reserves/step3', to:"reserves#step3", as:"step3_reserves"

  get '/users/:users_id/reserves/new', to: "reserves#new", as: "reserves_new"
  get '/users/:users_id/reserves/:id/edit', to: "reserves#edit", as: "reserves_edit"
  post '/users/:users_id/reserves/create', to: "reserves#create", as: "create_reserves"
  post '/users/:users_id/reserves/:id/show', to: "reserves#show", as: "reserves_show"
  get '/users/:users_id/reserves/:id/show', to: "reserves#show"


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
