class ProjectResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_manager_id, :integer
  attribute :location, :string
  attribute :completion_date, :date
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  belongs_to :project_manager,
             resource: UserResource

  has_many   :designers

  has_many   :details

  # Indirect associations

  has_many :suppliers do
    assign_each do |project, suppliers|
      suppliers.select do |s|
        s.id.in?(project.suppliers.map(&:id))
      end
    end
  end


  filter :supplier_id, :integer do
    eq do |scope, value|
      scope.eager_load(:suppliers).where(:products => {:supplier_id => value})
    end
  end
end
