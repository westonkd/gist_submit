class ClientCredentialsController < ApplicationController
  def create
    @client_credentials_data = {
      formAction: client_credentials_api_create_url,
      platformId: params[:platform_id],
      platformISS: params[:platform_iss],
      configurationUrl: 'https://www.test.com/banana'
    }.to_json
  end
end
