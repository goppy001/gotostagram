Rails.application.routes.draw do
  get 'users/new'
  get '/home', to: "static_pages#home"
  get '/help', to: "static_pages#help"
  get 'signup', to: "users#new"


end
