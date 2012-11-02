Terrier::Application.routes.draw do
  resources :news 
  match ':action'  => 'static#:action'
end
