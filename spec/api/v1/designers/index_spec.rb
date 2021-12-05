require 'rails_helper'

RSpec.describe "designers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/designers", params: params
  end

  describe 'basic fetch' do
    let!(:designer1) { create(:designer) }
    let!(:designer2) { create(:designer) }

    it 'works' do
      expect(DesignerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['designers'])
      expect(d.map(&:id)).to match_array([designer1.id, designer2.id])
    end
  end
end
