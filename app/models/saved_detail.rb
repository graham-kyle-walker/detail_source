class SavedDetail < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :detail

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    detail.to_s
  end
end
