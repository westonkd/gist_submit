module Api
  module V1
    class ClientCredentialsApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :require_admin

      def create
        byebug
        render json: ClientCredential.create!(client_credential_params), status: :created
      end

      private

      def client_credential_params
        @_client_credential_params ||= begin
          params.require(:client_credential).permit(:client_id, :platform_id).merge(
            { public_jwk: params.dig(:client_credential, :public_jwk).to_unsafe_hash }
          )
        end
      end
    end
  end
end
