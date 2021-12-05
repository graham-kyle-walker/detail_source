class CreateSavedDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_details do |t|
      t.integer :detail_id
      t.integer :user_id

      t.timestamps
    end
  end
end
