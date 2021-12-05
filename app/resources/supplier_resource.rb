class SupplierResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string
  attribute :contact_information, :string

  # Direct associations

  has_many   :products

  # Indirect associations

  has_many :projects do
    assign_each do |supplier, projects|
      projects.select do |p|
        p.id.in?(supplier.projects.map(&:id))
      end
    end
  end


  filter :project_id, :integer do
    eq do |scope, value|
      scope.eager_load(:projects).where(:details => {:project_id => value})
    end
  end
end
