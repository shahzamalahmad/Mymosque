Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'home/index'
  # get 'home/show'
  # post 'home/create'
  # put 'home/update'
  # delete 'home/destroy'
  resources :homes

  root "homes#index"
end
