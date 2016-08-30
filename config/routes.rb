Rails.application.routes.draw do

  root 'welcome#index'

  resources :buildings, only: [:index, :show]
  resources :addresses, only: [:index]
  resources :condos, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
