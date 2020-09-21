Rails.application.routes.draw do
  resources :clients
  root to: 'pages#home'
end
