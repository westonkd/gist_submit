class JwtVerifier
  attr_reader :errors
  def initialize(jwt, credentials)
    @jwt = jwt
    @credentials = credentials
    @errors = []
  end

  def valid_jwt?
    verify_audience(@jwt)
    verify_sub(@jwt)
    verify_nonce(@jwt)
    verify_issued_at(@jwt)
    verify_expiration(@jwt)
    errors.empty?
  end

  private

  def verify_audience(jwt)
    aud = jwt[:aud]
    aud_array = [*aud]
    errors << 'Audience must be a string or Array of strings.' unless aud_array.all? { |a| a.is_a? String }
    if jwt.key? :azp
      verify_azp(aud, jwt[:azp])
    else
      errors << 'Audience not found on Platform' unless public_key_matches_one_of_client_ids(aud)
    end
  end

  def verify_azp(aud, azp)
    errors << 'Audience does not contain/match Authorized Party' unless azp_in_aud(aud, azp)
    errors << 'Audience does not match Platform client_id' unless public_key_matches_one_of_client_ids(aud)
  end

  def verify_sub(jwt)
    errors << 'Subject not present' if jwt[:sub].blank?
  end

  def verify_issued_at(jwt)
    lower_bound = issued_at_lower_bound
    errors << "Issued at of #{jwt[:iat]} not between #{lower_bound.to_i} and #{Time.zone.now.to_i}" unless Time.zone.at(
      jwt[:iat]
    ).between?(
      lower_bound, Time.zone.now
    )
  end

  def verify_expiration(jwt)
    now = Time.zone.now
    errors << "Expiration time of #{jwt[:exp]} before #{now.to_i}" unless Time.zone.at(jwt[:exp]) > Time.zone.now
  end

  def verify_nonce(jwt)
    # TODO: Verify nonce
  end

  def azp_in_aud(aud, azp)
    if aud.is_a? Array
      aud.include? azp
    else
      aud == azp
    end
  end

  def issued_at_lower_bound
    ENV.key?('issued_at_minutes_ago') ? ENV['issued_at_minutes_ago'].minutes.ago : 10.minutes.ago
  end

  def public_key_matches_one_of_client_ids(aud)
    @credentials.exists?(client_id: aud)
  end
end
