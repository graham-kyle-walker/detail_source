Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "details#index"
  resources :comments
  resources :saved_details
  devise_for :users
  resources :users
  resources :designers
  resources :projects
  resources :suppliers
  resources :products
  resources :materials
  resources :details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
