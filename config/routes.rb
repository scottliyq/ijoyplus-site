Terrier::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :categories do 
	  get 'page/:page', :action => :index, :on => :collection
	  get 'page/:page', :action => :show, :on => :member
  end

  resources :news do
		get 'page/:page', :action => :index, :on => :collection	  
  end

  root to: 'static#index'
  match ':action'  => 'static#:action'
end
