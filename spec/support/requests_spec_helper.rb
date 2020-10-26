require 'json'

module RequestsSpecHelper
  def json_response
    JSON.parse(response.body)['data']
  end

  def json_included
    JSON.parse(response.body)['included']
  end
end
