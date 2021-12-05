class Product < ApplicationRecord
  # Direct associations

  belongs_to :supplier

  has_many   :use_case,
             :class_name => "Material",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
