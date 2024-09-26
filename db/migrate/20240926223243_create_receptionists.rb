class CreateReceptionists < ActiveRecord::Migration[7.2]
  def change
    create_table :receptionists do |t|
      t.datetime :login_sessions, array: true, default: []

      t.timestamps
    end
  end
end
