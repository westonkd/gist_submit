require 'test_helper'

class PlatformsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get platforms_api_create_url
    assert_response :success
  end

end
