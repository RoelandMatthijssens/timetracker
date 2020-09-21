Rails.application.routes.draw do
  resources :projects
  resources :clients
  root to: 'pages#home'
end
