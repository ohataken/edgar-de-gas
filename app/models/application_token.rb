class ApplicationToken
  attr_reader :key, :token

  def self.find key
    token = ApplicationToken.new key
    token.load
    token
  end

  def initialize key = ""
    @key = key
  end

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
    Google::Auth::Stores::RedisTokenStore.new(redis: Redis::Objects.redis)
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

  def generate_key
    @key = SecureRandom.alphanumeric
  end

  def load
    @token = token_store.load(@key)
  end

  def store
    token_store.store(@key, @token)
  end

  def delete
    token_store.delete(@key)
  end

  def credentials
    authorizer.get_credentials(@key)
  end
end
