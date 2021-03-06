Rails.application.routes.draw do
  resources :reviews
  resources :products do
    resources :carts
  end

  resources :users do
    resources :carts
  end

  # get 'static_pages/about'
  #
  # get 'static_pages/help'

  # root 'sessions#new'
  root 'products#index'
  get 'sessions/new'

  get '/signup', to: 'users#new'
  get '/login', to: 'session#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'

  get '/products/carts', to: 'carts#index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
