class AddDesignersReferenceToDesigners < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :designers, :users
    add_index :designers, :user_id
  end
end
