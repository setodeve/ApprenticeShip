Rails.application.routes.draw do
  namespace :api do
    post   "/users/login",   to: "sessions#create"
    get   "/user",   to: "users#show"
    put   "/user",   to: "users#update"
    get   "/articles/:id/edit",   to: "articles#edit"
    resources :articles
    resources :tags
    resources :users
    resource :session, only: %i[destroy]
  end
end
