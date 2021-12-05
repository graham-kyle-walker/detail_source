require 'rails_helper'

RSpec.describe "suppliers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/suppliers/#{supplier.id}"
  end

  describe 'basic destroy' do
    let!(:supplier) { create(:supplier) }

    it 'updates the resource' do
      expect(SupplierResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Supplier.count }.by(-1)
      expect { supplier.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
