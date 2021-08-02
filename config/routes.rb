Rails.application.routes.draw do
  resources :professors
  root to: 'home#index'
end
