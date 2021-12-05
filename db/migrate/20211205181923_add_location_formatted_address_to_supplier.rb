class AddLocationFormattedAddressToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :location_formatted_address, :string
  end
end
