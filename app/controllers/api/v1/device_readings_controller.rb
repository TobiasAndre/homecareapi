module Api
  module V1
    class DeviceReadingsController < ApiController
      skip_before_action :verify_authenticity_token
      before_action :require_login

      def get_by_tracking_number
        begin
          @device_reading = DeviceReading.find_by(tracking_number: params[:tracking_number])
          render json: @device_reading, status: :ok
        rescue Exception => errors
          render json: errors, status: :unprocessable_entity
        end
      end

      def get_device_stats
        begin
          @device_reading = DeviceReading.find_by(device_id: @current_device.id)
          unless @device_reading.nil?
            render json: @device_reading.reading_data.to_json, status: :ok
          else
            render json: 'no data found', status: :not_found
          end
        rescue Exception => errors
          render json: errors, status: :unprocessable_entity
        end
      end

      def create
        @device_reading = DeviceReading.new(device_reading_params)
        @device_reading.device = @current_device
        @device_reading.tracking_number = ((@current_device.device_readings.size)+1)
        
        ReadingsWorker.perform_async(@device_reading.to_json)
        render json: @device_reading, status: :created
      rescue StandardError => error
        raise error
        render json: { message: error.message }, status: :unprocessable_entity
      end

      private

      def device_reading_params
        params.permit(
          :temperature, :humidity, :battery_charge
        )
      end
    end
  end
end