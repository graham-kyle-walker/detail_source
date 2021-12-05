require 'rails_helper'

RSpec.describe Supplier, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:products) }

    end

    describe "InDirect Associations" do

    it { should have_many(:projects) }

    end

    describe "Validations" do

    end
end
