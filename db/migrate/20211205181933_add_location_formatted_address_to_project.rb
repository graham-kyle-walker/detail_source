class AddLocationFormattedAddressToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :location_formatted_address, :string
  end
end
