require "rails_helper"

RSpec.describe SavedDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "saved_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SavedDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SavedDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:saved_detail) { create(:saved_detail) }

    let(:payload) do
      {
        data: {
          id: saved_detail.id.to_s,
          type: "saved_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SavedDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { saved_detail.reload.updated_at }
      # .and change { saved_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:saved_detail) { create(:saved_detail) }

    let(:instance) do
      SavedDetailResource.find(id: saved_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SavedDetail.count }.by(-1)
    end
  end
end
