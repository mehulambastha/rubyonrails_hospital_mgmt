class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.datetime :date_of_creation
      t.integer :role_id
      t.string :role_code
      t.integer :assigned_to

      t.timestamps
    end

    add_foreign_key :users, :roles, column: :role_id
  end
end
