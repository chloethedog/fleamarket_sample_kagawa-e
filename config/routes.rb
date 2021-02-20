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
    resources :cards, only:[:new, :create, :show, :destroy]
  end
  resources :items do
    resources :favorites, only: :create
    collection do
      get :search
    end
    resources :purchases, only:[:index] do
      collection do
        get :pay
      end 
    end 
    resources :comments, only: [:create] do
      namespace :api do
        resources :comments, only: :index, default: {format: 'json' } 
      end
    end
  end
  #   resources :items do
  #     resources :purchases, only: [:index] do
  #       collection do
  #         get :pay
  #         get :search
  #       end
  #     end
  #     resources :comments, only: [:create] do
  #     namespace :api do
  #       resources :comments, only: :index, default: {format: 'json' } 
  #     end
  #   end
  # resources :items do
  #   resources :purchases, only:[:index,] do
  #     collection do
  #       get :pay
  #     end
  #   end
  #   resources :cards, only:[:new, :create, :show, :destroy]

  resources :cards, only:[:new, :create, :show, :destroy]
end

  # resources :items do
  #   resources :purchases, only: [:index] do
  #     collection do
  #       get :pay
  #       get :search
  #     end
  #   end
  #   resources :comments,only: :create
  #   namespace :api do
  #     resources :comments, only: :index, default: {format: 'json' } 
  #   end
  # end
