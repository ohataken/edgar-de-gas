require "test_helper"

class ProjectDeploymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_deployments_index_url
    assert_response :success
  end

  test "should get show" do
    get project_deployments_show_url
    assert_response :success
  end
end
