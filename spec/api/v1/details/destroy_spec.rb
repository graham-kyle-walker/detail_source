require "rails_helper"

RSpec.describe "details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/details/#{detail.id}"
  end

  describe "basic destroy" do
    let!(:detail) { create(:detail) }

    it "updates the resource" do
      expect(DetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Detail.count }.by(-1)
      expect { detail.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
