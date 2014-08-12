ReIntApp::Application.routes.draw do
  devise_for :users
  resources :requests, only: [:new, :show, :create, :destroy]
  resources :readings
  resources :ratings
  

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "about", to: "pages#about", as: "about"
  get "faq", to: "pages#faq", as: "faq"
  get "my_requests", to: "requests#my_requests", as: "my_requests"
  get "open_requsts", to: "requests#open_requests", as: "open_requests"

   
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
