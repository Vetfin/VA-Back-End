class AddAddressIdToCondo < ActiveRecord::Migration[5.0]
  def change
    add_column :condos, :address_id, :integer
  end
end
