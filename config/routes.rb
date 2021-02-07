Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliveries', to: 'users/registrations#new_address'
  end
  root 'items#index'

  resources :users, only:[:show] do
    member do
      get :card
    end
  end
  
  resources :items, only: [:index, :show, :new] do
    resources :purchases, only:[:index]
  end

  resources :cards, only:[:new]
end
