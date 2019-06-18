class AssignmentsController < ApplicationController
  require_relative '../clients/gist_client'

  before_action :update_assignment, if: :current_user
  before_action :update_user, if: :current_user

  def show
    @assignments_show_data = {
      gists: gists.index.map(&:to_hash)
    }.to_json
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
    assignment.due_date ||= params[:due_date]
    assignment.title ||= params[:title]
    assignment.save!
  end
end
