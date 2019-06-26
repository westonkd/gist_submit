require 'test_helper'

class AssignmentsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get assignments_api_create_url
    assert_response :success
  end

end
