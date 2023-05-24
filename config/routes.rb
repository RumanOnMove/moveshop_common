MoveshopCommon::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :clients, only: [:index, :show, :create, :update, :destroy]
      resources :reviews, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
