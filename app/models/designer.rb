class Designer < ApplicationRecord
  # Direct associations

  belongs_to :designers,
             :required => false,
             :class_name => "User",
             :foreign_key => "user_id"

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
