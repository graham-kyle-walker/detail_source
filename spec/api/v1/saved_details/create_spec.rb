require "rails_helper"

RSpec.describe "saved_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/saved_details", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "saved_details",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(SavedDetailResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { SavedDetail.count }.by(1)
    end
  end
end
