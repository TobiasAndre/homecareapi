class DeviceReading < ApplicationRecord
  belongs_to :device

  def temperature_data
    temperature = DeviceReading.select("max(temperature),min(temperature),avg(temperature)").where(device_id: self.device.id)
    "\"temperature\": "+temperature[0].to_json
  end

  def humidity_data
    humidity = DeviceReading.select("max(humidity),min(humidity),avg(humidity)").where(device_id: self.device.id)
    "\"humidity\": "+humidity[0].to_json
  end

  def battery_charge_data
    battery_charge = DeviceReading.select("max(battery_charge),min(battery_charge),avg(battery_charge)").where(device_id: self.device.id)
    "\"battery_charge\": "+battery_charge[0].to_json
  end
  
end
