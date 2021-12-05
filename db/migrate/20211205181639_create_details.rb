class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.integer :project_id
      t.integer :designer_id
      t.float :success_score
      t.text :description
      t.string :image
      t.string :name

      t.timestamps
    end
  end
end
