class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :launch_redirect

  before_action :verfiy_state

  def launch_redirect
  end

  def assignment_selection
  end

  def course_navigation
  end

  def resource_link
  end

  private

  def verfiy_state
    # TODO: Verify integrity of state param
  end
end
