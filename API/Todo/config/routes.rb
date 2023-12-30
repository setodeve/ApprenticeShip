Rails.application.routes.draw do
  # get    "/signup",  to: "users#new"
  # get    "/login",   to: "sessions#new"
  # post   "/login",   to: "sessions#create"
  # delete "/logout",  to: "sessions#destroy"
  resources :todos
  # resources :users

  namespace :api do
    post   "/users/login",   to: "sessions#create"
    resources :users, only: %i[create]
    resource :session, only: %i[destroy]
  end
end

