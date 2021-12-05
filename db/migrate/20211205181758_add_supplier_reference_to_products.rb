class AddSupplierReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :suppliers
    add_index :products, :supplier_id
    change_column_null :products, :supplier_id, false
  end
end
