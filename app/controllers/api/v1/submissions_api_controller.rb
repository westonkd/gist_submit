module Api
  module V1
    class SubmissionsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        render json: Submission.from_url(create_params[:url], create_params[:user_id], create_params[:assignment_id])
      end

      private

      def create_params
        params.permit(:user_id, :url, :content, :assignment_id)
      end
    end
  end
end