class AddProductReferenceToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :materials, :products
    add_index :materials, :product_id
    change_column_null :materials, :product_id, false
  end
end
