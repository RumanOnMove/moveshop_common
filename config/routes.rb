MoveshopCommon::Engine.routes.draw do
  resources :clients, only: [:index, :show, :create, :update, :destroy]
end
