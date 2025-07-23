Rails.application.routes.draw do

  #config/routes.rb
  scope "(:locale)", locale: /en|vi/ do
    get "microposts/index"
    get "static_pages/home"
    get "static_pages/help"
    get "static_pages/contact"
    get "signup", to: "users#new"
    post "signup", to: "users#create"

    resources :users, only: %i(show)
    resources :microposts, only: [:index]
    resources :products
  end
end
