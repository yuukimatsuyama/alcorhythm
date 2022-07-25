Rails.application.routes.draw do
  get 'schedule/index'
  devise_for :users
  root to:"schedules#index"
  resources :schedules
  resources :overview, only: :index 
  resources :users, only: :show
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
