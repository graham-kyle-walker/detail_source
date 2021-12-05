class DetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :designer_id, :integer
  attribute :success_score, :float
  attribute :description, :string
  attribute :image, :string
  attribute :name, :string

  # Direct associations

  belongs_to :designer

  belongs_to :project

  has_many   :comments

  has_many   :bookmarks,
             resource: SavedDetailResource

  has_many   :materials

  # Indirect associations

  many_to_many :products

  has_one    :detailer,
             resource: UserResource
  has_many :suppliers do
    assign_each do |detail, suppliers|
      suppliers.select do |s|
        s.id.in?(detail.suppliers.map(&:id))
      end
    end
  end


  filter :supplier_id, :integer do
    eq do |scope, value|
      scope.eager_load(:suppliers).where(:products => {:supplier_id => value})
    end
  end

  filter :user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:detailer).where(:designers => {:user_id => value})
    end
  end
end
