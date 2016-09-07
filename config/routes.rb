Rails.application.routes.draw do

  root 'welcome#index'

  resources :buildings, only: [:index, :show]
  # get 'condos/search' => 'condos#search'
  resources :condos, only: [:index, :show] do
    collection do
      get :search
    end
    member do
      post :favorite
    end
  end
  resources :searches, only: [:create]
  resources :users, only: [:create, :show] do
    member do
      post :login
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
