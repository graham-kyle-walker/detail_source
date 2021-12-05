require 'rails_helper'

RSpec.describe Project, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:project_manager) }

    it { should have_many(:designers) }

    it { should have_many(:details) }

    end

    describe "InDirect Associations" do

    it { should have_many(:suppliers) }

    end

    describe "Validations" do

    end
end
