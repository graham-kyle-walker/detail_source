require "rails_helper"

RSpec.describe DetailResource, type: :resource do
  describe "serialization" do
    let!(:detail) { create(:detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(detail.id)
      expect(data.jsonapi_type).to eq("details")
    end
  end

  describe "filtering" do
    let!(:detail1) { create(:detail) }
    let!(:detail2) { create(:detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:detail1) { create(:detail) }
      let!(:detail2) { create(:detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      detail1.id,
                                      detail2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      detail2.id,
                                      detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
