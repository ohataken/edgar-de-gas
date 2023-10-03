class Api::BaseController < ApplicationController
  def current_token
    @current_token ||= ApplicationToken.find(params[:key])
  end

  def script_service
    @script_service ||= Google::Apis::ScriptV1::ScriptService.new
  end

  def authorize_service!
    script_service.authorization = current_token.credentials
  end
end
