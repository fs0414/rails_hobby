Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    get 'users', to: 'users#index'
    post 'signup', to: 'users#signup'
    post 'signin', to: 'users#signin'

    resources :articles, only: %i[index create destroy] do
      resources :comments, only: %i[create destroy]
    end
    get 'personal_articles', to: 'articles#personal_article'
  end
end
