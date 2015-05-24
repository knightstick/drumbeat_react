Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :exercises, only: [:index, :show]
      resources :scores, only: [:index, :show]
    end
  end

  resources :exercises, only: [:index, :show]
end
