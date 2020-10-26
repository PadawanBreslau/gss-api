require 'rails_helper'

describe 'Locations requests' do
  describe 'GET /api/v1/locations/:id' do
    it 'returns a location' do
      subsection = create(:subsection)
      location = create(:location, subsection: subsection)
      get "/api/v1/locations/#{location.id}", headers: json_api_headers
      expect(response).to have_http_status :ok
      body = json_response['attributes']
      expect(body['attraction']).to be(false)
      expect(json_included.size).to eq 1
      expect(json_included.first['attributes']['lat']).to be_present
    end
  end
end
