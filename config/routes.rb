Rails.application.routes.draw do
  devise_for :users
  resources :histories
  resources :abonnements
  resources :customers
  resources :codes
  resources :kits
  root to: 'home#index'
  scope :api, defaults: {format: :json} do
    scope :v1 do
      # check kit ID
      get "check_kit", to: "api#verify_kit"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
