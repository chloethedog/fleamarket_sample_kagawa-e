Rails.application.routes.draw do
  root 'items#index'
  resources :item, only: :show
  # あとで消す
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
