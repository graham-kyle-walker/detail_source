class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comment_description, :string
  attribute :user_id, :integer
  attribute :detail_id, :integer

  # Direct associations

  belongs_to :user

  belongs_to :detail

  # Indirect associations
end
