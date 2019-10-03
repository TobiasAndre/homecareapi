# frozen_string_literal: true

class DeviceReading < ApplicationRecord

  belongs_to :device

  # creating a specific query to increase performance
  # and prevent too many queries at the database
  def reading_data
    result_query = ActiveRecord::Base.connection.execute(
      'select max, min, avg, reading_type from (' \
      " select max(temperature),min(temperature),avg(temperature),'temperature' as reading_type " \
      "   from device_readings where device_id = #{device.id} union " \
      " select max(humidity),min(humidity),avg(humidity),'humidity' as reading_type " \
      "   from device_readings where device_id = #{device.id} union " \
      " select max(battery_charge),min(battery_charge),avg(battery_charge),'battery_charge' as reading_type " \
      "   from device_readings where device_id = #{device.id} )as results"
    )
    result_query
  end

end
