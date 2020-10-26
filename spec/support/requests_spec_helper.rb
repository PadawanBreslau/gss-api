require 'json'

module RequestsSpecHelper
  def json_response
    JSON.parse(response.body)['data']
  end
end
