class ProductResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :price, :float
  attribute :description, :string
  attribute :supplier_id, :integer
  attribute :image, :string

  # Direct associations

  belongs_to :supplier

  has_many   :use_case,
             resource: MaterialResource

  # Indirect associations

  many_to_many :details

end
