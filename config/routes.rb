Rails.application.routes.draw do


root 'demo#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

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

  get 'demo/escape_output'


  
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get "demo/index"

  #match "demo/index", :to => "demo#index", :via => ":get"
  
end
