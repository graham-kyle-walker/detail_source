class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_description
      t.integer :user_id
      t.integer :detail_id

      t.timestamps
    end
  end
end
