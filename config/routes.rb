Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'

  scope(controller: :message) do
    post 'launch_redirect', action: :launch_redirect, as: :launch_redirect
    get 'messages/assignment_selection', action: :assignment_selection, as: :assignment_selection
    get 'messages/course_navigation', action: :course_navigation, as: :course_navigation
    get 'messages/resource_link', action: :resource_link, as: :resource_link
  end

  scope(controller: :login) do
    post 'login', action: :login, as: :login
  end

  scope(controller: :client_credentials) do
    get 'client_credentials/new', action: :create, as: :client_credentials_create
  end

  scope(controller: :platforms) do
    get 'platforms/new', action: :create
  end

  namespace :api do
    namespace :v1 do
      scope(controller: :tool_configurations_api) do
        get 'tool_configurations/:platform_id', action: :show, as: :tool_configurations_api_show
      end

      scope(controller: :client_credentials_api) do
        post 'client_credentials', action: :create, as: :client_credentials_api_create
      end

      scope(controller: :platforms_api) do
        post 'platforms', action: :create, as: :platforms_api_create
      end
    end
  end
end