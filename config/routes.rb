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
      
    end
  end
  
  resources :items, only: [:index, :show, :new, :create, :edit, :update,  :destroy] do
    resources :purchases, only:[:index]

  end

  resources :cards

end
