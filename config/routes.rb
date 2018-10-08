Rails.application.routes.draw do
  devise_for :admin_users
  resources :admin_users, only: [:index]

  root 'admin_users#index'
end
