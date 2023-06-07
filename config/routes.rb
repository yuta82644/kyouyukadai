Rails.application.routes.draw do
  root 'pictures#index'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy, :index ]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
