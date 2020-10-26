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
end
