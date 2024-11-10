Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :category, only: [:index, :show, :create, :update, :destroy] 
      resources :product, only: [:index, :show, :create, :update, :destroy] 

      post 'auth/login', to: 'auth#login'

    end
  end
end
