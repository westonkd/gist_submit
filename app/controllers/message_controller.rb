class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :launch_redirect

  before_action :verfiy_state

  def launch_redirect
    render json: jwt_verifier.errors unless jwt_verifier.valid_jwt?
    set_form_values
  end

  def assignment_selection
  end

  def course_navigation
  end

  def resource_link
  end

  private

  def set_form_values
    @form_action = redirect_url
    @method = "POST"
    @form_params = launch_params
  end

  def launch_params
    {
      id_token: params.require(:id_token)
    }
  end

  def jwt_verifier
    @jwt_verifier ||= JwtVerifier.new(decoded_jwt, platform.client_credentials)
  end

  def decoded_jwt
    @decoded_jwt ||= begin
      jwk_set = PublicJwkService.new(platform.public_key_uri).public_jwk_set
      JSON::JWT.decode id_token, jwk_set
    end
  end

  def id_token
    params.require(:id_token)
  end

  def platform
    @platform ||= begin
      extracted_issuer_id = JSON::JWT.decode(id_token, :skip_verification)[:iss]
      Platform.find_by!(iss: extracted_issuer_id)
    end
  end

  def redirect_url
    decoded_jwt['https://purl.imsglobal.org/spec/lti/claim/target_link_uri']
  end

  def verfiy_state
    # TODO: Verify integrity of state param
  end
end
