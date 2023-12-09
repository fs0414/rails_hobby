Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    get 'users', to: 'users#index'
    post 'signup', to: 'users#signup'
    post 'signin', to: 'users#signin'

    resources :articles, only: [ :index, :create, :destroy ]
  end
end
