Rails.application.routes.draw do
  get 'admin', to: 'admin#index', as: :admin_page
  get 'products_users/buy/:id', to: 'products_users#buy', as: :products_users_buy
  get 'products_users/cancel/:id', to: 'products_users#cancel', as: :products_users_cancel

  get 'dashboard', to: 'home#dashboard', as: 'dashboard'

  get 'home/profile', to: 'home#profile', as: :profile
  get 'home/index'
  get 'home/dashboard'
  resources :products

  devise_for :users
  root "home#index"



   
  get "up" => "rails/health#show", as: :rails_health_check

end
