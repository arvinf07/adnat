Rails.application.routes.draw do
  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  patch '/leave', to: 'users#leave', as: 'leave_organization'
  patch '/join/:id', to: 'users#join', as: 'join_organization'

  get '/password/edit', to: 'password#edit'
  patch '/password/edit', to: 'password#update'

  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'
  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'

  resources :shifts, except: [:show]
  resources :users, except: [:index]
  resources :organizations
  get '*path', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
