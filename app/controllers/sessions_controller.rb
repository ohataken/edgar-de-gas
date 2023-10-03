class SessionsController < ApplicationController
  def new
    @token = ApplicationToken.new
    redirect_to @token.authorizer.get_authorization_url(request: request), allow_other_host: true
  end

  def callback
    @token = ApplicationToken.new
    @token.generate_key
    @token.authorizer.handle_auth_callback(@token.key, request)
  end
end
