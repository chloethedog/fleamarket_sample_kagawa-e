Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:users

  resources :items, only: [:index, :show] do
    resources :purchases, only:[:index]
  end

end
