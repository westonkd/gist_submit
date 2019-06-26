module Api
  module V1
    class AssignmentsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        render json: {}
      end
    end
  end
end