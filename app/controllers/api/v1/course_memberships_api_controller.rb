require 'names_and_role_service'

module Api
  module V1
    class CourseMembershipsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :require_user

      def show
        membership = JSON.parse(nrps_service.membership_for_context(1).body)
        render json: membership
      end

      private

      def nrps_service
        @_nrps_service ||= NamesAndRolesServices.new(
          User::NRPS_URL,
          ClientCredential.find_by!(client_id: current_user.client_id)
        )
      end
    end
  end
end
