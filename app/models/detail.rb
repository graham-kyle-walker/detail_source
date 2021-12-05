class Detail < ApplicationRecord
  # Direct associations

  belongs_to :designer

  belongs_to :project

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :class_name => "SavedDetail",
             :dependent => :destroy

  has_many   :materials,
             :dependent => :destroy

  # Indirect associations

  has_many   :suppliers,
             :through => :products,
             :source => :supplier

  # Validations

  # Scopes

  def to_s
    project.to_s
  end

end
