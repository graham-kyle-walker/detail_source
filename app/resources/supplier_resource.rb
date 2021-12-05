class SupplierResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string
  attribute :contact_information, :string

  # Direct associations

  has_many   :products

  # Indirect associations

end
