require 'rails_helper'

RSpec.describe DesignerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'designers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DesignerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Designer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:designer) { create(:designer) }

    let(:payload) do
      {
        data: {
          id: designer.id.to_s,
          type: 'designers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DesignerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { designer.reload.updated_at }
      # .and change { designer.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:designer) { create(:designer) }

    let(:instance) do
      DesignerResource.find(id: designer.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Designer.count }.by(-1)
    end
  end
end
