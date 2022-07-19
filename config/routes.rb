Rails.application.routes.draw do
  get 'schedule/index'
  devise_for :users
  root to:"schedules#index"
  resources :schedules
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
