class AddDetailReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :details
    add_index :comments, :detail_id
    change_column_null :comments, :detail_id, false
  end
end
