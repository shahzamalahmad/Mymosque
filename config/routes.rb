Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'search#search', as: 'search'
  resources :homes
  root "homes#index"
end
