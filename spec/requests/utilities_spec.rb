require 'rails_helper'

describe 'Utilities requests' do
  describe 'GET /api/v1/utilities/:id' do
    it 'returns an utility' do
      utility = create(:utility)
      get "/api/v1/utilities/#{utility.id}", headers: json_api_headers
      expect(response).to have_http_status :ok
      body = json_response['attributes']
      expect(body['utility_type']).to eq 'accommodation'
    end
  end
end
