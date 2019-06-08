class PublicJwkService
  def initialize(public_jwk_url)
    @public_jwk_url = public_jwk_url
  end

  def public_jwk_set
    JSON::JWK::Set.new(JSON.parse(HTTParty.get(@public_jwk_url).body))
  end
end
