# frozen_string_literal: true

module DeviceReadings
  class CreateService

    attr_reader :device_reading

    def initialize(device_reading:)
      @device_readings = DeviceReading.new(JSON.parse(device_reading))
    end

    def call
      ActiveRecord::Base.transaction do
        @device_readings.save!
      rescue ActiveRecord::RecordInvalid => e
        raise e
      end
    end

  end
end
