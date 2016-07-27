Rails.application.routes.draw do
  get 'sessions/new'

  # get '/signup', to: 'users#new'
  get '/login', to: 'session#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
