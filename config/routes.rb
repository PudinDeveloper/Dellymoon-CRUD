Rails.application.routes.draw do
  resources :order_foods
  resources :tickets
  resources :foods
  devise_for :users
  get 'main/home'
  root "main#home"
end
