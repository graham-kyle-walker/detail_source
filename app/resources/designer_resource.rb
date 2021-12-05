class DesignerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :designers,
             resource: UserResource,
             foreign_key: :user_id

  has_many   :details

  belongs_to :project

  # Indirect associations

end
