Rails.application.routes.draw do
  namespace :api do
    resources :articles
    resources :tags
    resources :users
  end
end
