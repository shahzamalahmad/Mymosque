Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'search#search', as: 'search'
  resources :homes
  resources :credits, only: [:index, :show]
  resources :about_us, only: [:index, :show]
  resources :terms_and_conditions, only: [:index, :show]
  resources :privacy_policies, only: [:index, :show]
  root "homes#index"
end
