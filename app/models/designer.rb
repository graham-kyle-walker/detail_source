class Designer < ApplicationRecord
  # Direct associations

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    project.to_s
  end

end
