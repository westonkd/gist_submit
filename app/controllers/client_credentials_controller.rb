class ClientCredentialsController < ApplicationController
  def create
    @client_credentials_data = {
      formAction: api_v1_client_credentials_api_create_url,
      platformId: params[:platform_id],
      platformISS: params[:platform_iss],
      configurationUrl: api_v1_tool_configurations_api_show_url(platform_id: params[:platform_id])
    }.to_json
  end
end
