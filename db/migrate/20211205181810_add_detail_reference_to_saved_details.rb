class AddDetailReferenceToSavedDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_details, :details
    add_index :saved_details, :detail_id
    change_column_null :saved_details, :detail_id, false
  end
end
