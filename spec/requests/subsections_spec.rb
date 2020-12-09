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

    context 'with trivia' do
      it 'returns a subsection' do
        subsection = create(:subsection, start: 'Bardo', finish: 'Złoty Stok')
        create(:trivium, triviable: subsection, content: 'Takie coś innego')
        get "/api/v1/subsections/#{subsection.id}", headers: json_api_headers
        expect(response).to have_http_status :ok
        expect(json_included.size).to eq 1
        expect(json_included.first['type']).to eq 'trivium'
        expect(json_included.first['attributes']['content']).to eq 'Takie coś innego'
      end

      it 'returns gps location' do
        subsection = create(:subsection, start: 'Bardo', finish: 'Złoty Stok')
        create(:trivium, :gps_location, triviable: subsection)
        get "/api/v1/subsections/#{subsection.id}", headers: json_api_headers
        expect(response).to have_http_status :ok
        expect(json_included.size).to eq 1
        expect(json_included.first['type']).to eq 'trivium'
        expect(json_included.first['attributes']['lat']).to be_present
        expect(json_included.first['attributes']['lon']).to be_present
      end
    end
  end
end
