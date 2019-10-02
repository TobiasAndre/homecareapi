# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController

      skip_before_action :verify_authenticity_token

      def require_login
        current_device || render_unauthorized('Access denied')
      end

      def current_device
        @current_device ||= authenticate_token
      end

      protected

      def render_unauthorized(message)
        errors = { errors: [{ detail: message }] }
        render json: errors, status: :unauthorized
      end

      private

      def authenticate_token
        authenticate_with_http_token do |token, _options|
          Device.find_by(household_token: token)
        end
      end

    end
  end
end
