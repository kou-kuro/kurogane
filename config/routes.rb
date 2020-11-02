Rails.application.routes.draw do
  devise_for :users
  post '/callback', to: 'linebot#callback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  # resources :articles, only: [:index, :new, :create, :show]
  resources :articles, only: [:index, :new, :create, :show] do
    collection do 
      get 'business'
      get 'science'
      get 'technology'
    end
    # resources :favorites, only: [:create, :destroy]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite' 

  # resources :favorites, only: [:create, :destroy]
  resources :news, only: [:index, :create]
end
