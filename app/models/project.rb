class Project < ApplicationRecord
  # Direct associations

  has_many   :designers,
             :dependent => :destroy

  has_many   :details,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    project_manager.to_s
  end

end