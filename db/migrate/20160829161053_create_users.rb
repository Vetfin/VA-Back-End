class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :users_condos, id: false do |t|
      t.integer :user_id
      t.integer :condo_id
    end
  end
end
