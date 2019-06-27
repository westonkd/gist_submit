require 'ags_service'

module Api
  module V1
    class AssignmentsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        byebug
        render json: {}
      end

      private

      def ags_service
        @ags_service ||= begin
          AgsService.new('', client_credential)
        end
      end

      def client_credential
        @_client_credential ||= ClientCredential.find_by!(client_id: current_user.client_id)
      end
    end
  end
end