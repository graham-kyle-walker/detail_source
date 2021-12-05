require "rails_helper"

RSpec.describe DesignerResource, type: :resource do
  describe "serialization" do
    let!(:designer) { create(:designer) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(designer.id)
      expect(data.jsonapi_type).to eq("designers")
    end
  end

  describe "filtering" do
    let!(:designer1) { create(:designer) }
    let!(:designer2) { create(:designer) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: designer2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([designer2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:designer1) { create(:designer) }
      let!(:designer2) { create(:designer) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      designer1.id,
                                      designer2.id,
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
                                      designer2.id,
                                      designer1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
