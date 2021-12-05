require "rails_helper"

RSpec.describe "suppliers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/suppliers/#{supplier.id}", params: params
  end

  describe "basic fetch" do
    let!(:supplier) { create(:supplier) }

    it "works" do
      expect(SupplierResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("suppliers")
      expect(d.id).to eq(supplier.id)
    end
  end
end
