# frozen_string_literal: true

module Api
  module V1
    class DevicesController < ApiController

      before_action :require_login

      def show
        render json: { token: @current_device.location }
      end

    end
  end
end
