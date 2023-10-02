class SessionsController < ApplicationController
  helper_method :token_key

  def new
    redirect_to authorizer.get_authorization_url(request: request), allow_other_host: true
  end

  def callback
    authorizer.handle_auth_callback(token_key, request)
  end

  private

  def client
    @client ||= create_client
  end

  def create_client
    client_id = ENV.fetch("GOOGLE_CLIENT_ID", "xxxx.apps.googleusercontent.com")
    client_secret = ENV.fetch("GOOGLE_CLIENT_SECRET", "xxxxxxxx")
    Google::Auth::ClientId.new(client_id, client_secret)
  end

  def token_store
    @token_store ||= create_token_store
  end

  def create_token_store
    Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
  end

  def authorizer
    @authorizer ||= create_authorizer
  end

  def create_authorizer
    Google::Auth::WebUserAuthorizer.new(client, oauth2_scope, token_store, '/oauth2/callback')
  end

  def oauth2_scope
    [
      'https://www.googleapis.com/auth/drive',
      'https://www.googleapis.com/auth/script.processes',
      'https://www.googleapis.com/auth/script.projects',
      'https://www.googleapis.com/auth/script.deployments',
    ]
  end

  def token_key
    @token_key ||= SecureRandom.alphanumeric
  end
end
