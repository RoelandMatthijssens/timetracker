Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :clients
  root to: 'pages#home'
end
