require 'test_helper'

class ClientCredentialsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get client_credentials_api_create_url
    assert_response :success
  end

end
