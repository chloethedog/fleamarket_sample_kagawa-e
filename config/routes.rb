Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'api/items/category',to: 'items#get_category'
  resources :users, only:[:show] do
    member do
      get :card
    end
  end
  
  resources :items, only: [:index, :show, :new, :create] do
    resources :purchases, only:[:index]

  end

  resources :cards, only:[:new]

end
