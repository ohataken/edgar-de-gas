class Api::ProjectDeploymentsController < Api::BaseController
  before_action :authorize_service!

  def index
    render json: script_service.list_project_deployments(params[:project_id])
  end

  def show
    render json: script_service.get_project_deployment(params[:project_id], params[:id])
  end
end
