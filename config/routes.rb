Rails.application.routes.draw do
  devise_for :admin_users
  resources :admin_users, only: [:index]
  resources :posts

  root 'posts#index'
end
