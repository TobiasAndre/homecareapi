# frozen_string_literal: true

module Api
  module V1
    class DeviceReadingsController < ApiController

      before_action :require_login

      def reading_by_tracking_number
        @device_reading = DeviceReading.find_by(tracking_number: params[:tracking_number])
        render json: @device_reading, status: :ok
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      def device_stats
        @device_reading = DeviceReading.find_by(device_id: @current_device.id)
        if @device_reading.nil?
          render json: 'no data found', status: :not_found
        else
          render json: @device_reading.reading_data.to_json, status: :ok
        end
      rescue StandardError => e
        render json: e, status: :unprocessable_entity
      end

      def create
        @device_reading = DeviceReading.new(device_reading_params)
        @device_reading.device = @current_device
        @device_reading.tracking_number = (@current_device.device_readings.size + 1)

        ReadingsWorker.perform_async(@device_reading.to_json)
        render json: @device_reading, status: :created
      rescue StandardError => e
        render json: { message: e.message }, status: :unprocessable_entity
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
