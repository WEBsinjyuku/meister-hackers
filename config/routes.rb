Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # 後ほど変更
  root 'sessions#test'
  # ログイン機能実装後削除
  post '/login_dev', to: 'sessions#login_dev'

  delete '/logout', to: 'sessions#destroy'

  resources :posts, only: %i(new create edit update index)
end
