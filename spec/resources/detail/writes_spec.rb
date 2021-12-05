require "rails_helper"

RSpec.describe DetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Detail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:detail) { create(:detail) }

    let(:payload) do
      {
        data: {
          id: detail.id.to_s,
          type: "details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { detail.reload.updated_at }
      # .and change { detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:detail) { create(:detail) }

    let(:instance) do
      DetailResource.find(id: detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Detail.count }.by(-1)
    end
  end
end
