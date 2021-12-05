require 'rails_helper'

RSpec.describe SavedDetailResource, type: :resource do
  describe 'serialization' do
    let!(:saved_detail) { create(:saved_detail) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(saved_detail.id)
      expect(data.jsonapi_type).to eq('saved_details')
    end
  end

  describe 'filtering' do
    let!(:saved_detail1) { create(:saved_detail) }
    let!(:saved_detail2) { create(:saved_detail) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: saved_detail2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([saved_detail2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:saved_detail1) { create(:saved_detail) }
      let!(:saved_detail2) { create(:saved_detail) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_detail1.id,
            saved_detail2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_detail2.id,
            saved_detail1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
