Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :exercises, only: [:index, :show] do
        resources :scores, only: [:create]
      end
      # Do we want to move this into nested within exercises?
      resources :scores, only: [:index, :show]
    end
  end

  get 'exercises/unlocks' => 'exercises#unlocks'
  post 'exercises/unlock/:id' => 'exercises#unlock', as: 'exercise_unlock'
  resources :exercises, only: [:index, :show]
end
