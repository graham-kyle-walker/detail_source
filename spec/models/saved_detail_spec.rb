require 'rails_helper'

RSpec.describe SavedDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should belong_to(:detail) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
