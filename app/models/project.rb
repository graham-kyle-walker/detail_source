class Project < ApplicationRecord
  # Direct associations

  belongs_to :project_manager,
             :class_name => "User"

  has_many   :designers,
             :dependent => :destroy

  has_many   :details,
             :dependent => :destroy

  # Indirect associations

  has_many   :suppliers,
             :through => :details,
             :source => :suppliers

  # Validations

  # Scopes

  def to_s
    project_manager.to_s
  end

end
