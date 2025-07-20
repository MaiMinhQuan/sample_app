Rails.application.routes.draw do
  get 'microposts/index'
  resources :products
  get 'demo_partials/new'
  get 'demo_partials/edit'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'

  resources :microposts, only: [:index]
end
