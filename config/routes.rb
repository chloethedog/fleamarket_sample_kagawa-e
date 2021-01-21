Rails.application.routes.draw do
  root 'items#index'
  # あとで消す
  resources :items
  # あとで消す
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
