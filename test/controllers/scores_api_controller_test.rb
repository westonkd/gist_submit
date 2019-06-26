require 'test_helper'

class ScoresApiControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get scores_api_create_url
    assert_response :success
  end

end
