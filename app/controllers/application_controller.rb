class ApplicationController < ActionController::Base
  before_action :set_application_data

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def require_admin
    head :unauthorized unless current_user.is_admin?
  end

  def require_user
    redirect_to :root unless current_user.present?
  end

  private

  def set_application_data
    @application_data = {
      login_path: '/auth/github',
      user_id: current_user&.lti_id
    }.to_json
  end
end
