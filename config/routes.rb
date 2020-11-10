Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    collection do 
      get 'business'
      get 'science'
      get 'technology'
    end
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite' 

  resources :news, only: [:index, :create]
end
