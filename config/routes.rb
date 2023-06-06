Rails.application.routes.draw do
  root 'pictures#index'
 resources :users, only: [:new, :create, :show]
 resources :sessions, only: [:new, :create, :show]
 resources :pictures do
  collection do
    post :confirm
  end
 end
end
#プロフィール編集機能たす？a