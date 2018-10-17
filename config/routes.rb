Rails.application.routes.draw do
  
  devise_for :users
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  post 'customers/new' => 'customers#new'
  post 'carts/confirm' => 'carts#confirm'
  post 'carts/saveorder' => 'carts#saveorder'

  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :customers   , :only => [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :products
  resources :carts
  
  root 'home#top'
  
  
end
