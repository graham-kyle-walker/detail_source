class AddLocationLongitudeToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :location_longitude, :float
  end
end
