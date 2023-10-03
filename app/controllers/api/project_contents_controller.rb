class Api::ProjectContentsController < Api::BaseController
  before_action :authorize_service!

  def index
    render json: script_service.get_project_content(params[:project_id])
  end
end
