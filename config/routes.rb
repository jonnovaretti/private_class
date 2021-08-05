Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'
  resources :professors
  root to: 'home#index'

  namespace :professor do
    get 'signin', to: 'sessions#index'
    post 'signin', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'students', to: 'students#index'
    get 'invites', to: 'invites#index'
    post 'invites', to: 'invites#post'
  end

  namespace :student do
    get 'invites/:identifier', to: 'invites#index'
    post 'invites', to: 'invites#create'
    get 'signin', to: 'sessions#index'
    post 'signin', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'lessons', to: 'lessons#index'
    get 'home', to: 'home#index'
  end
end
