Rails.application.routes.draw do

  root 'welcome#index'

  resources :buildings, only: [:index, :show]
  # get 'condos/search' => 'condos#search'
  resources :condos, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :searches, only: [:create]
  resources :users, only: [:create, :show]

  resources :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
