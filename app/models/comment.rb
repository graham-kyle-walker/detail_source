class Comment < ApplicationRecord
  # Direct associations

  belongs_to :detail

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    comment_description
  end

end
