class ProjectVersionsController < ApplicationController
  before_action :authorize_service!

  def index
    @versions = script_service.list_project_versions(params[:project_id])
  end

  def show
    @version = script_service.get_project_version(params[:project_id], params[:id])
  end
end
