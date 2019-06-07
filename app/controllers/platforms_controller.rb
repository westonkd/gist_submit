class PlatformsController < ApplicationController

  before_action :require_admin

  def create
    @platforms_data = {
      formAction: platforms_api_create_url,
      credentialUrl: client_credentials_create_url
    }.to_json
  end
end
