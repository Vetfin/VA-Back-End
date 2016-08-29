class CreateUsersCondosJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :condos do |t|
      # t.index [:user_id, :condo_id]
      # t.index [:condo_id, :user_id]
    end
  end
end
