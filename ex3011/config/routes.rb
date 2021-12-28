Rails.application.routes.draw do
  resources :posts
  get 'pages/home'
  root 'pages#home'
  
  resources :users, except: [:new]
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
