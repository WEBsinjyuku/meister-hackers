Rails.application.routes.draw do
  root :to => 'posts#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: %i(show edit) do
    resources :profiles, only: %i(index update)
  end

  resources :posts, only: %i(new create edit update show index destroy) do
    resources :messages, only: %i(index create)
  end

  get "error/404", controller: 'application', action: 'render_404'
  get "error/500", controller: 'application', action: 'render_500'

  if Rails.env.production?
    get '*path', controller: 'application', action: 'render_404'
  end
end
