Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "user" => "home#user"
  authenticated :user do
    root 'home#user', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end
  
  resources :products do
    get 'index', on: :collection
    get 'new', on: :new
    get 'edit', on: :member
    get 'show', on: :member
  end

 
  get "up" => "rails/health#show", as: :rails_health_check


end
