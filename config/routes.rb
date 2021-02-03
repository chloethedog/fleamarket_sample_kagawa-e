Rails.application.routes.draw do
  root 'items#index'
  resources :users, only:[:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :create] do
    resources :purchases, only:[:index]
  end
end
