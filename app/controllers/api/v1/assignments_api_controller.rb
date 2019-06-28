require 'ags_service'

module Api
  module V1
    class AssignmentsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        response = JSON.parse(ags_service.create_assignment(create_params).body)
        render json: {
          title: response['label'],
          due_date: params[:due_date],
          lti_id: SecureRandom.uuid # This is just dummy data
        }
      end

      private

      def create_params
        params.permit(:name, :due_date, :points_possible, :course_id)
      end

      def ags_service
        @ags_service ||= begin
          AgsService.new(
            Assignment.line_item_url_for_course(params[:course_id]),
            client_credential
          )
        end
      end

      def client_credential
        @_client_credential ||= ClientCredential.find_by!(client_id: current_user.client_id)
      end
    end
  end
end