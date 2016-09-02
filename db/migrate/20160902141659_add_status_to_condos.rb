class AddStatusToCondos < ActiveRecord::Migration[5.0]
  def change
    add_column :condos, :status, :string
  end
end
