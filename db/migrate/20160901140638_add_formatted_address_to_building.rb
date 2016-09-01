class AddFormattedAddressToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :formatted_address, :string
  end
end
