require "test_helper"

class ProjectContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_contents_index_url
    assert_response :success
  end

  test "should get show" do
    get project_contents_show_url
    assert_response :success
  end

  test "should get edit" do
    get project_contents_edit_url
    assert_response :success
  end
end
