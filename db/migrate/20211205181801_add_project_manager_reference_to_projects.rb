class AddProjectManagerReferenceToProjects < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :projects, :users, column: :project_manager_id
    add_index :projects, :project_manager_id
    change_column_null :projects, :project_manager_id, false
  end
end
