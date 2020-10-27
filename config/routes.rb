Rails.application.routes.draw do
  devise_for :users
  post '/callback', to: 'linebot#callback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  # resources :articles, only: [:index, :new, :create, :show]
  resources :articles, only: [:index, :new, :create, :show] do
    collection do 
      get 'science'
      get 'technology'
    end
  end
  resources :news, only: [:index, :create]
end
