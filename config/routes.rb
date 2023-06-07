Rails.application.routes.draw do
  root "pictures#index"
  resources :users, only: %i[new create show edit update]
  resources :sessions, only: %i[new create show destroy]
  resources :favorites, only: %i[create destroy index]
  resources :pictures do
    collection { post :confirm }
  end
end
