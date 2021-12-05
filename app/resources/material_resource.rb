class MaterialResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :product_id, :integer
  attribute :detail_id, :integer

  # Direct associations

  # Indirect associations

end
