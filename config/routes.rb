Rails.application.routes.draw do

  resources :products

  devise_for :users
  root "home#index"
  get "user" => "home#user"
  authenticated :user do
    root 'home#user', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end
   
  get "up" => "rails/health#show", as: :rails_health_check

end
