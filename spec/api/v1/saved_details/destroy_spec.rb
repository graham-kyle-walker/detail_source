require 'rails_helper'

RSpec.describe "saved_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/saved_details/#{saved_detail.id}"
  end

  describe 'basic destroy' do
    let!(:saved_detail) { create(:saved_detail) }

    it 'updates the resource' do
      expect(SavedDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SavedDetail.count }.by(-1)
      expect { saved_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
