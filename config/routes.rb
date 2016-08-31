Rails.application.routes.draw do

  root 'welcome#index'

  resources :buildings, only: [:index]
  resources :addresses, only: [:index, :show]
  resources :condos, only: [:index]
  get 'condos/search' => 'condos#search'
  resources :searches, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
