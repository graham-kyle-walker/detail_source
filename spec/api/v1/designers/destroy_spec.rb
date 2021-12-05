require 'rails_helper'

RSpec.describe "designers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/designers/#{designer.id}"
  end

  describe 'basic destroy' do
    let!(:designer) { create(:designer) }

    it 'updates the resource' do
      expect(DesignerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Designer.count }.by(-1)
      expect { designer.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
