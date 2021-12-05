Rails.application.routes.draw do
  resources :projects
  resources :suppliers
  resources :products
  resources :materials
  resources :details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
