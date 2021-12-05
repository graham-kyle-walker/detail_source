class AddDesignerReferenceToDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :details, :designers
    add_index :details, :designer_id
    change_column_null :details, :designer_id, false
  end
end
