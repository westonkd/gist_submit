require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get launch_redirect" do
    get message_launch_redirect_url
    assert_response :success
  end

  test "should get assignment_selection" do
    get message_assignment_selection_url
    assert_response :success
  end

  test "should get course_navigation" do
    get message_course_navigation_url
    assert_response :success
  end

  test "should get resource_link" do
    get message_resource_link_url
    assert_response :success
  end

end
