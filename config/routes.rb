Rails.application.routes.draw do
  get 'static_pages/about'
  root 'albums#index'

  # get 'categories/index'
  # get 'artists/index'
  # get 'songs/index'
  # get 'albums/index'
  get 'about', to: 'static_pages#about'
  get 'categories', to: 'categories#index'
  get 'songs', to: 'songs#index'

  resources :categories, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :albums, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :countries, only: [:index]
end
