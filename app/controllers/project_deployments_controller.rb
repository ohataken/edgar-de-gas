class ProjectDeploymentsController < ApplicationController
  before_action :authorize_service!

  def index
    @deployments = script_service.list_project_deployments(params[:project_id])
  end

  def show
    @deployment = script_service.get_project_deployment(params[:project_id], params[:id])
  end
end
