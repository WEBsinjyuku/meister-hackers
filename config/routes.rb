Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # 後ほど変更
  root :to => 'posts#index'

  resources :posts, only: %i(new create edit update show index) do
    resources :messages, only: %i(index create)
  end
end
