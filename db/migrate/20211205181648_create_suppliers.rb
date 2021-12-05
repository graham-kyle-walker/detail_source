class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :location
      t.string :contact_information

      t.timestamps
    end
  end
end
