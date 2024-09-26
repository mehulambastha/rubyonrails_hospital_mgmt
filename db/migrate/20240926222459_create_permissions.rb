class CreatePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :permissions do |t|
      t.boolean :can_read
      t.boolean :can_create
      t.boolean :can_update
      t.boolean :can_delete

      t.timestamps
    end
  end
end
