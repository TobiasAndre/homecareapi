# frozen_string_literal: true

class DeviceReadingSerializer < ActiveModel::Serializer

  attributes :tracking_number, :temperature, :humidity, :battery_charge

end
