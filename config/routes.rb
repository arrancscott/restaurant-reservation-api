# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'v1/restaurants#index'

  get '/unauthorized', to: 'unauthorized#show'

  namespace :v1 do
    resources :restaurants do
      resources :guests do
        resources :reservations
      end
    end
  end
end
