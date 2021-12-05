class DetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :designer_id, :integer
  attribute :success_score, :float
  attribute :description, :string
  attribute :image, :string
  attribute :name, :string

  # Direct associations

  has_many   :materials

  # Indirect associations

end
