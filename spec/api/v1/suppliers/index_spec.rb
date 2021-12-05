require 'rails_helper'

RSpec.describe "suppliers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/suppliers", params: params
  end

  describe 'basic fetch' do
    let!(:supplier1) { create(:supplier) }
    let!(:supplier2) { create(:supplier) }

    it 'works' do
      expect(SupplierResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['suppliers'])
      expect(d.map(&:id)).to match_array([supplier1.id, supplier2.id])
    end
  end
end
