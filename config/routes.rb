Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :comments

      resources :saved_details

      resources :users

      resources :designers

      resources :projects

      resources :suppliers

      resources :products

      resources :materials

      resources :details

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
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
