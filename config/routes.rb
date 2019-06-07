Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'

  scope(controller: :client_credentials) do
    post 'client_credentials', action: :create, as: :client_credentials_api_create
  end

  scope(controller: :client_credentials) do
    get 'client_credentials/new', action: :create, as: :client_credentials_create
  end

  scope(controller: :platforms_api) do
    post 'platforms', action: :create, as: :platforms_api_create
  end

  scope(controller: :platforms) do
    get 'platforms/new', action: :create
  end
end