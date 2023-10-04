class Api::ProjectsController < Api::BaseController
  before_action :authorize_service!

  def show
    render json: script_service.get_project(params[:id])
  end
end
