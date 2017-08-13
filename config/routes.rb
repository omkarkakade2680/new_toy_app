Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  #get 'users/new'

  root 'static_pages#home'
  #get  '/help',    to: 'static_pages#help', as: 'helf'
  match 'help' => 'static_pages#help', :via => [:get], :as => 'help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout' => :destroy,  to: 'sessions#destroy'
  resources :users
   resources :account_activations, only: [:edit]
   resources :password_resets,     only: [:new, :create, :edit, :update]
end