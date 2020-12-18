Rails.application.routes.draw do
  resources :missions
  resources :scientists, only: [:index, :show, :new, :create, :edit, :destroy, :update]
  resources :planets, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
