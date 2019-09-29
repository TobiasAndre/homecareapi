class CreateDeviceReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :device_readings do |t|
      t.integer :tracking_number
      t.float :temperature
      t.float :humidity
      t.float :battery_charge
      t.timestamps
    end
    add_reference :device_readings, :device, index: true
    add_foreign_key :device_readings, :devices
  end
end
