require 'rails_helper'

describe 'Sections requests' do
  describe 'GET /api/v1/sections/:id' do
    it 'returns a section' do
      section = create(:section, start: 'Bardo', finish: 'Złoty Stok')
      get "/api/v1/sections/#{section.id}", headers: json_api_headers
      expect(response).to have_http_status :ok
      body = json_response['attributes']
      expect(body['start']).to eq 'Bardo'
      expect(body['finish']).to eq 'Złoty Stok'
    end
  end
end
