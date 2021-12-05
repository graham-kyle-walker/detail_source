require "rails_helper"

RSpec.describe "details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/details", params: params
  end

  describe "basic fetch" do
    let!(:detail1) { create(:detail) }
    let!(:detail2) { create(:detail) }

    it "works" do
      expect(DetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["details"])
      expect(d.map(&:id)).to match_array([detail1.id, detail2.id])
    end
  end
end
