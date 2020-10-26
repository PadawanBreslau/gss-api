require 'rails_helper'

describe 'Subections requests' do
  describe 'GET /api/v1/subsections/:id' do
    it 'returns a subsection' do
      subsection = create(:subsection, start: 'Bardo', finish: 'Kłodzka Góra')
      get "/api/v1/subsections/#{subsection.id}", headers: json_api_headers
      expect(response).to have_http_status :ok
      body = json_response['attributes']
      expect(body['start']).to eq 'Bardo'
      expect(body['finish']).to eq 'Kłodzka Góra'
    end
  end
end
