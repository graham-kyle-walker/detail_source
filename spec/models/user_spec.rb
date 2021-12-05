require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    it { should have_many(:bookmarks) }

    it { should have_many(:projects) }

    it { should have_many(:assigned_project) }

    end

    describe "InDirect Associations" do

    it { should have_many(:details) }

    end

    describe "Validations" do

    end
end
