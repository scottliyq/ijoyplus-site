Terrier::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :categories
  resources :news 

  match ':action'  => 'static#:action'
end
