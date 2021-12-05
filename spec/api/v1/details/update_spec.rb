require 'rails_helper'

RSpec.describe "details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/details/#{detail.id}", payload
  end

  describe 'basic update' do
    let!(:detail) { create(:detail) }

    let(:payload) do
      {
        data: {
          id: detail.id.to_s,
          type: 'details',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { detail.reload.attributes }
    end
  end
end
