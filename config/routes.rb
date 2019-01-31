Rails.application.routes.draw do
  # 後ほど変更
  root 'sessions#test'
  # ログイン機能実装後削除
  post '/login_dev', to: 'sessions#login_dev'
  root :to => 'oauth_test#index'
  delete '/logout', to: 'sessions#destroy'
  # deviseログイン
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

end
