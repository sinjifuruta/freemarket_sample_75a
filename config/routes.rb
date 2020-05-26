Rails.application.routes.draw do

  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end








  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :users, only: [:show]
  resources :items do
    resources :purchases, only: [:index]
  end
  resources :profiles, only: [:new, :show, :create]
  resources :addresses, only: [:new]
  
end
