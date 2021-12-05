class Designer < ApplicationRecord
  # Direct associations

  has_many   :details,
             :dependent => :destroy

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    project.to_s
  end

end
