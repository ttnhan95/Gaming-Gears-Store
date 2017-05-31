require './app/models/store'
Rails.application.routes.draw do
  match 'catalog' => Store.new, via: :all
  get 'admins' => 'admins#index'
  controller :sessions do
    get  'login' => :login
    post 'login' => :create
    delete 'logout' => :destroy
  end
  #root 'products#index
  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :searches
    resources :orders
    resources :categories
    resources :cart_products
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
end