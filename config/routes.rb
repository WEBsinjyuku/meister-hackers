Rails.application.routes.draw do
  root :to => 'posts#index'
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: %i(show edit) do
    resources :profiles, only: %i(show update)
  end

  resources :posts, only: %i(new create edit update show index) do
    resources :messages, only: %i(index create)
  end
end
