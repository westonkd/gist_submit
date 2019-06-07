class PlatformsApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :require_admin

  def create
    render json: Platform.create!(platform_params), status: :created
  end

  def platform_params
    @_platform_params ||= begin
      params.require(:platform).permit(:public_key_uri, :authorization_uri, :iss)
    end
  end
end
