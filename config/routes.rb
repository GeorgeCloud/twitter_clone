Rails.application.routes.draw do


  get 'sessions/new'
  #Routes '/' to Home Page
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/login', to: 'static_pages#login'

  # User Routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
