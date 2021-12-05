require 'rails_helper'

RSpec.describe Material, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:product) }

    it { should belong_to(:detail) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
