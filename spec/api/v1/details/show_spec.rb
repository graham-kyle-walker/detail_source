require 'rails_helper'

RSpec.describe "details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/details/#{detail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:detail) { create(:detail) }

    it 'works' do
      expect(DetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('details')
      expect(d.id).to eq(detail.id)
    end
  end
end
