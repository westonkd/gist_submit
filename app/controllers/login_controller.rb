class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  before_action :set_form_values

  def login
  end

  private

  def set_form_values
    @form_action = platform.authorization_uri
    @method = "GET"
    @form_params = authentication_response_params
  end

  def authentication_response_params
    {
      scope: 'openid',
      response_type: 'id_token',
      client_id: client_credential.client_id,
      redirect_uri: launch_redirect_url,
      login_hint: params[:login_hint],
      lti_message_hint: params[:lti_message_hint],
      # TODO: Cache state to verify integrity
      state: SecureRandom.uuid,
      response_mode: 'form_post',
      nonce: SecureRandom.uuid,
      prompt: 'none'
    }
  end

  def client_credential
    @_client_credential ||= platform.client_credentials.take
  end

  def platform
    @_platform ||= Platform.find_by(iss: params[:iss])
  end
end
