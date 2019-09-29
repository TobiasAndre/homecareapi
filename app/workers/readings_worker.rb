class ReadingsWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(readings)
    ::DeviceReadings::CreateService.new(device_reading: readings).call
  end
end