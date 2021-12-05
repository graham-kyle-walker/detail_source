require 'rails_helper'

RSpec.describe "saved_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_details/#{saved_detail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:saved_detail) { create(:saved_detail) }

    it 'works' do
      expect(SavedDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('saved_details')
      expect(d.id).to eq(saved_detail.id)
    end
  end
end
