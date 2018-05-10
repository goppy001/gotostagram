Rails.application.routes.draw do
  root    'sessions#new'
  get     '/post',    to: "static_pages#post"
  get     '/help',    to: "static_pages#help"
  get     '/signup',  to: "users#new"
  post    '/signup',  to: "users#create"
  get     '/login',   to: "sessions#new"
  post    '/login',   to: "sessions#create"
  delete  '/logout',  to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
