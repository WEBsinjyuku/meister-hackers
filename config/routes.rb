Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # 後ほど変更
  root :to => 'posts#index'
  # root 'sessions#test'
  # ログイン機能実装後削除
  post '/login_dev', to: 'sessions#login_dev'

  delete '/logout', to: 'sessions#destroy'

  resources :posts, only: %i(new create edit update index)
end
