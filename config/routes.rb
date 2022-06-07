Rails.application.routes.draw do
  resources :paiements
  devise_for :users
  resources :histories
  resources :abonnements
  resources :customers
  resources :codes
  resources :kits
  root to: 'home#index'
  scope :admin do
    get 'users', to: "home#users"
    match 'add_user', to: "home#add_new_user", via: [:get, :post  ]
    get 'abonnements_paiement', to: "home#abonnement_paiements"
  end
  scope :api, defaults: {format: :json} do
    scope :v1 do
      # check kit ID
      get "check_kit/:code_barre", to: "api#verify_kit"
      get "request_authorization", to: "api#request_authorization"
      get "save_api_paiement", to: "api#save_api_paiement"
      get "search_customer/:phone", to: "api#search_customer"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
