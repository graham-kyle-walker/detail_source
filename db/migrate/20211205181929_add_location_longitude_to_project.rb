class AddLocationLongitudeToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :location_longitude, :float
  end
end
