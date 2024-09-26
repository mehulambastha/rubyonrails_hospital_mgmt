class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.integer :appointments, array: true, default: []
      t.datetime :login_sessions, array: true, default: []

      t.timestamps
    end
  end
end
