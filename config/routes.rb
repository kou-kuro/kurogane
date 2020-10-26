Rails.application.routes.draw do
  devise_for :users
  post '/callback', to: 'linebot#callback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles, only: [:index, :new, :create, :show]
  resources :news, only: [:index, :create]
end
