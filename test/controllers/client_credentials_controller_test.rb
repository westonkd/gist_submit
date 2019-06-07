require 'test_helper'

class ClientCredentialsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get client_credentials_create_url
    assert_response :success
  end

end
