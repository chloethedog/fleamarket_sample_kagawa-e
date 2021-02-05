Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only:[:show] do
    member do
      get :card
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show] do
    resources :purchases, only:[:index]
  end
  resources :cards, only:[:new]
end
