class Api::ProjectVersionsController < Api::BaseController
  before_action :authorize_service!

  def index
    render json: script_service.list_project_versions(params[:project_id])
  end

  def show
    render json: script_service.get_project_version(params[:project_id], params[:id])
  end
end
