class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :bookmarks,
             resource: SavedDetailResource

  has_many   :projects,
             foreign_key: :project_manager_id

  has_many   :assigned_project,
             resource: DesignerResource

  # Indirect associations

end
