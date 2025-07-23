Rails.application.routes.draw do

  #config/routes.rb
  scope "(:locale)", locale: /en|vi/ do
    root "microposts#index"

    get "static_pages/home"
    get "static_pages/help"
    get "static_pages/contact"

    get "signup", to: "users#new"
    post "signup", to: "users#create"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :users, only: %i(show index edit update destroy create)
    resources :microposts, only: [:index]
    resources :products
    resources :account_activations, only: :edit
  end
end
