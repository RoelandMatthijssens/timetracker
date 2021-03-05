Rails.application.routes.draw do
  resources :timelogs
  devise_for :users
  resources :projects
  resources :clients
  root to: 'timelogs#index'
end
