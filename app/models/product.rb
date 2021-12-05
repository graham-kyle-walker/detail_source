class Product < ApplicationRecord
  # Direct associations

  belongs_to :supplier

  has_many   :use_case,
             :class_name => "Material",
             :dependent => :destroy

  # Indirect associations

  has_many   :details,
             :through => :use_case,
             :source => :detail

  # Validations

  # Scopes

  def to_s
    name
  end

end
