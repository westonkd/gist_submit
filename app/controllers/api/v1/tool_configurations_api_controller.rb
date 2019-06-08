require_relative '../../../lti/tool_configuration'

module Api
  module V1
    class ToolConfigurationsApiController < ApplicationController
      def show
        render json: Lti::ToolConfiguration.new(request.host_with_port, request.protocol, platform)
      end

      private

      def platform
        Platform.find(params[:platform_id])
      end
    end
  end
end