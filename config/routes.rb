Rails.application.routes.draw do
  # get 'restaurants', to: 'restaurants#index'

  # get 'restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # post 'restaurants', to: 'restaurants#create'

  # get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  resources :restaurants, only: %i[index show new create] do
    member do
      resources :reviews, only: %i[new create]
    end
  end
end
