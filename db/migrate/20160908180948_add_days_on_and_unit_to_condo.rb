class AddDaysOnAndUnitToCondo < ActiveRecord::Migration[5.0]
  def change
    add_column :condos, :days_on, :integer
    add_column :condos, :unit, :integer
  end
end
