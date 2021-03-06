require "rails_helper"

RSpec.describe "suppliers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/suppliers/#{supplier.id}", payload
  end

  describe "basic update" do
    let!(:supplier) { create(:supplier) }

    let(:payload) do
      {
        data: {
          id: supplier.id.to_s,
          type: "suppliers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SupplierResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { supplier.reload.attributes }
    end
  end
end
