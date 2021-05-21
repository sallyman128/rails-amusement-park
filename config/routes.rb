Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :update, :new, :create, :edit]
  resources :rides, only: :update
  get "/signin", to: "sessions#signin"
  post "/signin", to: "sessions#login"
  post "/logout", to: "sessions#logout"
  root "users#new"
end
