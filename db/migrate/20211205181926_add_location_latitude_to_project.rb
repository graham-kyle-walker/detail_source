class AddLocationLatitudeToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :location_latitude, :float
  end
end
