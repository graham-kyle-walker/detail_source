class Material < ApplicationRecord
  # Direct associations

  belongs_to :detail

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
