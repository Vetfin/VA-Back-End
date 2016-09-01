class ChangeAddressIdToBuildingIdForCondos < ActiveRecord::Migration[5.0]
  def change
    remove_column :condos, :address_id, :integer
    add_column :condos, :building_id, :integer
  end
end
