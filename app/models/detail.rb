class Detail < ApplicationRecord
  # Direct associations

  has_many   :materials,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    project.to_s
  end

end
