class ProjectsController < ApplicationController
  before_action :authorize_service!

  def show
    @project = script_service.get_project(params[:id])
  end
end
