Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :order_foods
  resources :tickets
  resources :foods
  devise_for :users
  get 'main/home'
  root "main#home"
end
