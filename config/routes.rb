Rails.application.routes.draw do
  get 'condos/index'

  get 'addresses/index'

  root 'welcome#index'

  resources :condos, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
