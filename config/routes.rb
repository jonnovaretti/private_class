Rails.application.routes.draw do
  resources :professors
  root to: 'home#index'

  namespace :professor do
    get 'signin', to: 'sessions#index'
    post 'signin', to: 'sessions#create'
    get 'students', to: 'students#index'
    delete 'logout', to: 'sessions#destroy'
  end
end
