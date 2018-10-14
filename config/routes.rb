Rails.application.routes.draw do
  
  devise_for :users
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  post 'customers/new' => 'customers#new'

  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :customers   , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :products
  post 'carts/confirm' => 'carts#confirm'
  resources :carts
  
  root 'home#top'
  
  
end
