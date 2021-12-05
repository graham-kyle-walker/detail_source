require 'rails_helper'

RSpec.describe Detail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:designer) }

    it { should belong_to(:project) }

    it { should have_many(:comments) }

    it { should have_many(:bookmarks) }

    it { should have_many(:materials) }

    end

    describe "InDirect Associations" do

    it { should have_many(:products) }

    it { should have_one(:detailer) }

    it { should have_many(:suppliers) }

    end

    describe "Validations" do

    end
end
