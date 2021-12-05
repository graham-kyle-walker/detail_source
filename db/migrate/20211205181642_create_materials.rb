class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :product_id
      t.integer :detail_id

      t.timestamps
    end
  end
end
