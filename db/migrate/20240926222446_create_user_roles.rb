class CreateUserRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :user_roles do |t|
      t.string :role_name
      t.string :role_code
      t.boolean :immutable
      t.boolean :can_login
      t.integer :permission_id

      t.timestamps
    end
  end
end
