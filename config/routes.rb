Rails.application.routes.draw do
  # /admin redirect
  get '/admin' => redirect('/admin_panel')
  get '/admin/login' => redirect('/admin_panel')
  get '/users/sign_up' => redirect('/users/sign_in')

  resources :order_foods
  resources :tickets
  resources :foods
  resources :admin_panel
  devise_for :users

  get 'main/home'
  root "main#home"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
