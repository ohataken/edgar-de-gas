require "test_helper"

class ProjectVersionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_versions_index_url
    assert_response :success
  end

  test "should get show" do
    get project_versions_show_url
    assert_response :success
  end
end
