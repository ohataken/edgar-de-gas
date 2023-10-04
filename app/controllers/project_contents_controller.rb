class ProjectContentsController < ApplicationController
  before_action :authorize_service!

  def index
    @contents = script_service.get_project_content(params[:project_id])
  end

  def show
  end

  def edit
  end
end
