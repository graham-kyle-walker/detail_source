class AddDetailReferenceToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :materials, :details
    add_index :materials, :detail_id
    change_column_null :materials, :detail_id, false
  end
end
