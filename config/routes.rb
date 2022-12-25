Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  root "posts#index"
  resources :posts
  get 'published', to: 'posts#published'
end
