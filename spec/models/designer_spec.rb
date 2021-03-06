require "rails_helper"

RSpec.describe Designer, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:designers) }

    it { should have_many(:details) }

    it { should belong_to(:project) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
