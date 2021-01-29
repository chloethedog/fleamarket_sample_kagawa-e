Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :show] do
    resources :purchases, only:[:index]
  end
end
