Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'
  resources :professors
  root to: 'home#index'

  namespace :professor do
    get 'signin', to: 'sessions#index'
    post 'signin', to: 'sessions#create'
    get 'students', to: 'students#index'
    delete 'logout', to: 'sessions#destroy'
    get 'invites', to: 'invites#index'
    post 'invites', to: 'invites#post'
  end

  namespace :student do
    get 'invites/:identifier', to: 'invites#index'
    post 'invites', to: 'invites#create'
  end
end
