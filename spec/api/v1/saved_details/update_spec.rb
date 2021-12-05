require "rails_helper"

RSpec.describe "saved_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/saved_details/#{saved_detail.id}", payload
  end

  describe "basic update" do
    let!(:saved_detail) { create(:saved_detail) }

    let(:payload) do
      {
        data: {
          id: saved_detail.id.to_s,
          type: "saved_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SavedDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { saved_detail.reload.attributes }
    end
  end
end
