class CreateCondos < ActiveRecord::Migration[5.0]
  def change
    create_table :condos do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :condo_name
      t.integer :price
      t.integer :sq_ft
      t.integer :beds
      t.float :baths
      t.boolean :parking
      t.integer :hoa
      t.integer :zillow_id
      t.integer :address_id

      t.timestamps
    end
  end
end
