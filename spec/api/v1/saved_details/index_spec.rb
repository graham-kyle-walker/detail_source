require "rails_helper"

RSpec.describe "saved_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_details", params: params
  end

  describe "basic fetch" do
    let!(:saved_detail1) { create(:saved_detail) }
    let!(:saved_detail2) { create(:saved_detail) }

    it "works" do
      expect(SavedDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["saved_details"])
      expect(d.map(&:id)).to match_array([saved_detail1.id, saved_detail2.id])
    end
  end
end
