class Detail < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :class_name => "SavedDetail",
             :dependent => :destroy

  has_many   :materials,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    project.to_s
  end

end
