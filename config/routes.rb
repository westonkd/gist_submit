Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'

  scope(controller: :message) do
    post 'launch_redirect', action: :launch_redirect, as: :launch_redirect
    post 'messages/assignment_selection', action: :assignment_selection, as: :assignment_selection
    post 'messages/course_navigation', action: :course_navigation, as: :course_navigation
    post 'messages/resource_link', action: :resource_link, as: :resource_link
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

  scope(controller: :assignments) do
    get 'assignments/:lti_id', action: :show, as: :show_assignment
    get 'teacher/assignments/:lti_id', action: :teacher_show, as: :teacher_show
    get 'assignments', action: :index, as: :assignments_index
  end

  namespace :api do
    namespace :v1 do
      scope(controller: :tool_configurations_api) do
        get 'tool_configurations/:platform_id', action: :show, as: :tool_configurations_api_show
      end

      scope(controller: :assignments_api) do
        post 'assignments', action: :create, as: :assignments_api_create
      end

      scope(controller: :client_credentials_api) do
        post 'client_credentials', action: :create, as: :client_credentials_api_create
      end

      scope(controller: :platforms_api) do
        post 'platforms', action: :create, as: :platforms_api_create
      end

      scope(controller: :scores_api) do
        post 'scores', action: :create, as: :scores_api_create
      end

      scope(controller: :submissions_api) do
        post 'submissions', action: :create, as: :submissions_api_create
      end

      scope(controller: :course_memberships_api) do
        get 'course_memberships/:context_id', action: :show, as: :course_memberships_api_show
      end
    end
  end
end