class AssignmentsController < ApplicationController
  require_relative '../clients/gist_client'

  before_action :update_assignment, if: :current_user, only: :show
  before_action :update_user, if: :current_user

  def show
    if current_user.present?
      @assignments_show_data = {
        gists: gists.index.map(&:to_hash),
        create_scores_url: api_v1_scores_api_create_url
      }.to_json
    end
  end

  def index
    if current_user.present?
      @assignments_index_data = {
        assignments: Assignment.where(user: current_user),
        create_assignments_url: api_v1_assignments_api_create_url
      }.to_json
    end
  end

  private

  def assignment
    @_assignment ||= begin
      Assignment.find_or_create_by!(
        lti_id: params[:lti_id],
        lti_course_id: params[:course_id],
        user: current_user
      )
    end
  end

  def gists
    @_gists ||= Clients::GistClient.new(current_user)
  end

  def update_user
    # TODO: Associate the user with the platform.
    # That way we can lookup the correct credentials
    # to make an AGS request when we are outside of an LTI
    # launch
  end

  def update_assignment
    assignment.due_date = (assignment.due_date.presence || params[:due_date])
    assignment.title = (assignment.title.presence || params[:title])
    assignment.save!
  end
end
