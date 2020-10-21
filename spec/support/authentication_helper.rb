module AuthenticationHelper
  def auth_headers(player)
    auth_tokens = player.create_new_auth_token
    json_api_headers.merge(auth_tokens)
  end

  def json_api_headers
    {
      'Accept' => 'application/vnd.api+json',
      'Content-Type' => 'application/vnd.api+json'
    }
  end

  def basic_auth_headers
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(
      ENV['PIPEDRIVE_WEBHOOKS_USER'], ENV['PIPEDRIVE_WEBHOOKS_PASSWORD']
    )
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json',
      'HTTP_AUTHORIZATION' => credentials
    }
  end
end
