Freemark::Application.routes.draw do
  resources :links

  get "welcome/index"
  match "dashboard", :to => "users#dashboard", :as => :dashboard
  match "login", :to => "sessions#new", :as => :login
  match "logout", :to => "sessions#destroy", :as => :logout

  resources :users

  resources :sessions

  root :to => 'welcome#index'

  match '*code' => "links#visit"
end
