class ApplicationController < ActionController::Base
  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def require_admin
    head :unauthorized unless current_user.is_admin?
  end
end
