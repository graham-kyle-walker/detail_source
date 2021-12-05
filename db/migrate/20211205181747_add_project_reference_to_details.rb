class AddProjectReferenceToDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :details, :projects
    add_index :details, :project_id
    change_column_null :details, :project_id, false
  end
end
