Rails.application.routes.draw do
  get 'sessions/new'
 resources :users, only: [:new, :create, :show]
 resources :sessions, only: [:new, :create, :show]
end
#プロフィール編集機能たす？a