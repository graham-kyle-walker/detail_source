class ProjectResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_manager_id, :integer
  attribute :location, :string
  attribute :completion_date, :date
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  belongs_to :project_manager,
             resource: UserResource

  has_many   :designers

  has_many   :details

  # Indirect associations

end
