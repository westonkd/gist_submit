module Api
  module V1
    class ScoresApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :require_user

      def create
        puts params
      end
    end
  end
end
