Freemark::Application.routes.draw do
  get "welcome/index"

  resources :users
  resources :session

  root :to => 'welcome#index'
end
