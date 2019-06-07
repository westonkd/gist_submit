require 'test_helper'

class PlatformsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get platforms_create_url
    assert_response :success
  end

end
