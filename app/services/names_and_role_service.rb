require 'client_credentials_grant_service'

class NamesAndRolesServices
  def initialize(nrps_url, client_credential)
    @client_credential = client_credential
    @nrps_url = nrps_url
  end

  def membership_for_context(context_id)
    request_url = @nrps_url.sub(':context_id', context_id.to_s)
    HTTParty.get(request_url, { headers: {'Authorization' => "Bearer #{access_token}"} })
  end

  private

  def grant_service
    @_grant_service ||= ClientCredentialsGrantService.new(
      @client_credential.platform.grant_url,
      @client_credential
    )
  end

  def access_token
    @_access_token ||= grant_service.request_token&.dig('access_token')
  end
end
