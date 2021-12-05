class AddUserReferenceToSavedDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_details, :users
    add_index :saved_details, :user_id
    change_column_null :saved_details, :user_id, false
  end
end
