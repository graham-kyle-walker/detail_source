require 'rails_helper'

RSpec.describe Detail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:project) }

    it { should have_many(:comments) }

    it { should have_many(:bookmarks) }

    it { should have_many(:materials) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
