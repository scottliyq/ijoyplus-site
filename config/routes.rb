Terrier::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match 'about' => "static#main"

  scope "/about" do 
    resources :categories do 
  	  get 'page/:page', :action => :index, :on => :collection
  	  get 'page/:page', :action => :show, :on => :member
    end

    resources :news do
  		get 'page/:page', :action => :index, :on => :collection	  
    end

    match 'about' => 'static#about'
    match 'product' => 'static#product'
    match 'business' => 'static#business'
    match 'join' => 'static#join'

    match ':action'  => 'static#:action'

  end

  root to: 'static#index'
  
end
