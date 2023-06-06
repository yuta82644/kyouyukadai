Rails.application.routes.draw do
 resources :users, only: [:new, :create, :show]
end
#プロフィール編集機能たす？a