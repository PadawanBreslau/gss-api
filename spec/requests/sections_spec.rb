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

    it 'returns all section' do
      create(:section, start: 'Bardo', finish: 'Złoty Stok', variation: 0)
      create(:section, start: 'Złoty Stok', finish: 'Przełęcz Lądecka', variation: 0)
      get '/api/v1/sections', headers: json_api_headers
      expect(response).to have_http_status :ok
      first = json_response.first['attributes']
      last = json_response.last['attributes']
      expect(first['start']).to eq 'Bardo'
      expect(first['finish']).to eq 'Złoty Stok'
      expect(last['start']).to eq 'Złoty Stok'
      expect(last['finish']).to eq 'Przełęcz Lądecka'
    end

    context 'with subsections' do
      it 'returns a section' do
        section = create(:section, start: 'Bardo', finish: 'Złoty Stok')
        create(:subsection, section: section, start: 'Bardo', finish: 'Kłodzka Góra')
        get "/api/v1/sections/#{section.id}", headers: json_api_headers
        expect(response).to have_http_status :ok
        expect(json_included.size).to eq 1
        expect(json_included.first['type']).to eq 'subsection'
        expect(json_included.first['attributes']['start']).to eq 'Bardo'
        expect(json_included.first['attributes']['finish']).to eq 'Kłodzka Góra'
      end
    end

    context 'with trivia' do
      it 'returns a section' do
        section = create(:section, start: 'Bardo', finish: 'Złoty Stok')
        create(:trivium, triviable: section, content: 'Takie coś')
        get "/api/v1/sections/#{section.id}", headers: json_api_headers
        expect(response).to have_http_status :ok
        expect(json_included.size).to eq 1
        expect(json_included.first['type']).to eq 'trivium'
        expect(json_included.first['attributes']['content']).to eq 'Takie coś'
      end
    end
  end
end
