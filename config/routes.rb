Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :users, only:[:show] do
    member do
      get :card
    end
  end
  
  resources :items, only: [:index, :show, :new] do
    resources :purchases, only:[:index]
    collection do
      get :search
    end  
  end

  resources :cards, only:[:new]
end
