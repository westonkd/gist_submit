require 'test_helper'

class Api::V1::ToolConfigurationsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_tool_configurations_api_show_url
    assert_response :success
  end

end
