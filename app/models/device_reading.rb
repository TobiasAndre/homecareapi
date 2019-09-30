class DeviceReading < ApplicationRecord
  belongs_to :device

  def reading_data
    result_query = ActiveRecord::Base.connection.execute(
      "select max, min, avg, reading_type from ("+
      " select max(temperature),min(temperature),avg(temperature),'temperature' as reading_type "+
      "   from device_readings where device_id = "+self.device.id.to_s+
      " union "+
      " select max(humidity),min(humidity),avg(humidity),'humidity' as reading_type "+
      "   from device_readings where device_id = "+self.device.id.to_s+
      " union "+
      " select max(battery_charge),min(battery_charge),avg(battery_charge),'battery_charge' as reading_type "+
      "   from device_readings where device_id = "+self.device.id.to_s+
      ")as results")

   result_query
  end
  
end
