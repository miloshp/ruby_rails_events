Rails.application.routes.draw do

  root 'page#index'
  get 'about', to: 'page#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'allusers', to: 'users#index'
  get 'sort_name', to: 'events#sort_name'
  get 'sort_due', to: 'events#sort_due'
  get 'sort_created', to: 'events#sort_created'

  resources :events
  resources :users, except: [:new]


end
