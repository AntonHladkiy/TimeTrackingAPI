# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :activities, :categories, :projects, :users
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      devise_for :users, controllers: { registrations: 'registrations' }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
