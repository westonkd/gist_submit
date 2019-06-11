class AssignmentsController < ApplicationController
  before_action :update_assignment, if: :current_user

  def show
  end

  def assignment
    @_assignment ||= begin
      Assignment.find_or_create_by!(
        lti_id: params[:lti_id],
        lti_course_id: params[:course_id],
        user: current_user
      )
    end
  end

  private

  def update_assignment
    assignment.due_date ||= params[:due_date]
    assignment.title ||= params[:title]
    assignment.save!
  end
end
