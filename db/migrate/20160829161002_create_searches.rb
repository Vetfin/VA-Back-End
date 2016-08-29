class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :zipcode
      t.string :city
      t.integer :min_price
      t.integer :max_price
      t.integer :min_feet
      t.integer :max_feet
      t.integer :min_bed
      t.integer :max_bed
      t.float :min_bath
      t.float :max_bath
      t.boolean :parking
      t.integer :min_hoa
      t.integer :max_hoa

      t.timestamps
    end
  end
end
