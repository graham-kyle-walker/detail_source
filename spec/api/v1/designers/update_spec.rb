require 'rails_helper'

RSpec.describe "designers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/designers/#{designer.id}", payload
  end

  describe 'basic update' do
    let!(:designer) { create(:designer) }

    let(:payload) do
      {
        data: {
          id: designer.id.to_s,
          type: 'designers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DesignerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { designer.reload.attributes }
    end
  end
end
