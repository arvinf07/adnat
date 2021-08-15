Rails.application.routes.draw do
  get '/', to: 'sessions#welcome', as: 'welcome'
  post '/signin', to: 'sessions#signin', as: 'signin'
  delete '/logout', to: 'sessions#logout', as: 'logout'
  patch '/leave', to: 'users#leave', as: 'leave_organization'
  resources :shifts
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
