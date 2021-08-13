Rails.application.routes.draw do
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#signin', as: 'signin'
  resources :shifts
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
