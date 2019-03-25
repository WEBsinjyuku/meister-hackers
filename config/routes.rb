Rails.application.routes.draw do
  get 'home/top'
  root :to => 'posts#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: %i(show edit) do
    resources :profiles, only: %i(index update)
    get "profiles2", :to => "profiles#index2"
  end

  resources :posts, only: %i(new create edit update show index destroy top) do
    resources :messages, only: %i(index create destroy)
  end

  get "error/404", controller: 'application', action: 'render_404'
  get "error/500", controller: 'application', action: 'render_500'

  if Rails.env.production?
    get '*path', controller: 'application', action: 'render_404'
  end
end
