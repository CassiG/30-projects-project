Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :tags
  resources :users

  get '/admin-login', to: 'sessions#new'
  post '/admin-login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/about', to: 'pages#show'
  root "posts#index"
end
