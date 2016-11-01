Rails.application.routes.draw do

  resources :pages do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end


  root 'demo#index'
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get "demo/index"

  #match "demo/index", :to => "demo#index", :via => ":get"
  
end
