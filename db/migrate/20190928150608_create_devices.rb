class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :household_token
      t.string :location

      t.timestamps
    end
  end
end
