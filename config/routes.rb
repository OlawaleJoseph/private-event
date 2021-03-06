# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :events, only: %i[new create show index]
  post '/events/:id/attend', to: 'events#attend'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  root 'events#index'
  get 'page/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
