require "rails_helper"

RSpec.describe "designers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/designers/#{designer.id}", params: params
  end

  describe "basic fetch" do
    let!(:designer) { create(:designer) }

    it "works" do
      expect(DesignerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("designers")
      expect(d.id).to eq(designer.id)
    end
  end
end
