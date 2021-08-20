Rails.application.routes.draw do
  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  patch '/leave', to: 'users#leave', as: 'leave_organization'
  patch '/join/:id', to: 'users#join', as: 'join_organization'

  get '/password/reset', to: 'password_reset#new'
  post '/password/reset', to: 'password_reset#create'

  resources :shifts
  resources :users, except: [:index]
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
