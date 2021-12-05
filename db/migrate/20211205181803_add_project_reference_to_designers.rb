class AddProjectReferenceToDesigners < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :designers, :projects
    add_index :designers, :project_id
    change_column_null :designers, :project_id, false
  end
end
