Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  resources :blog, only: %w[index show] do
    collection do
      resources :category, only: :show, to: 'blog#category'
      resources :tag, only: :show, to: 'blog#tag'
      get 'search', to: 'blog#search'
    end
  end

  get '/:page_type/:slug/', to: 'pages#index'
end
