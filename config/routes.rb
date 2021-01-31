Rails.application.routes.draw do
  root 'items#new'
  resources :users, only:[:show, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show] do
    resources :purchases, only:[:index]
  end
end
