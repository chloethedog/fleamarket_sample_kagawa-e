Rails.application.routes.draw do
  root 'items#index'
  resources :users, only:[:show]
  resources :items, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
