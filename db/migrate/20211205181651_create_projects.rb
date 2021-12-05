class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :project_manager_id
      t.string :location
      t.date :completion_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
