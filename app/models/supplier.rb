class Supplier < ApplicationRecord
  # Direct associations

  has_many   :products,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
