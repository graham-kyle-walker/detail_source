class Supplier < ApplicationRecord
  # Direct associations

  has_many   :products,
             :dependent => :destroy

  # Indirect associations

  has_many   :details,
             :through => :products,
             :source => :details

  has_many   :projects,
             :through => :details,
             :source => :project

  # Validations

  # Scopes

  def to_s
    name
  end

end
