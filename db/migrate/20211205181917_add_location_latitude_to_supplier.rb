class AddLocationLatitudeToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :location_latitude, :float
  end
end
