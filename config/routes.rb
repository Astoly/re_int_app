ReIntApp::Application.routes.draw do
  devise_for :users
  resources :requests
  resources :readings
  resources :ratings
  

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "about", to: "pages#about", as: "about"
   
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
