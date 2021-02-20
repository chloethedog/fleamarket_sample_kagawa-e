Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliveries', to: 'users/registrations#new_delivery'
    post 'deliveries', to: 'users/registrations#create_delivery'
  end
  root 'items#index'
  get 'api/items/category',to: 'items#get_category'
  resources :users, only:[:show] do
    member do
      get :card
      get :favorite
    end
  end
  
  resources :items do
    resources :purchases, only:[:index]
    resources :comments, only: :create
    resources :favorites, only: :create
    namespace :api do
      resources :comments, only: :index, default: {format: 'json' } 
    end
    
  end

  resources :cards, only:[:new]
end
