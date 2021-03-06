Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", confirmations: "users/confirmations",omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#landing"
  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    post :remove_from_cart, on: :member
    post :adjust_item, on: :member
    get :landing, on: :member
  end

  resource :users, only: :show do
    get :edit_member, on: :collection
    get :confirm_password, on: :collection
    post :update_member, on: :collection
    post :confirm, on: :collection
  end

  resource :cart

  post 'spgateway/return'
  post 'spgateway/notify'

  resources :orders do 
    post :checkout_spgateway, on: :member
  end

  resources :categories, only: :show do
    get :man, on: :collection
    get :woman, on: :collection
    get :kid, on: :collection
    get :baby, on: :collection
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :ajion2596dhi do
    root "products#index"
    resources :users
    resources :products
  end
end
