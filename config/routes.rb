Rails.application.routes.draw do
  devise_for :users
  root to:"schedule#index"

  resources :schedule,only: [:index]
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
