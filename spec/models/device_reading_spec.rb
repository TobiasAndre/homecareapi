# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeviceReading, type: :model do
  describe 'association' do
  end

  describe 'validations' do
    it { validate_presence_of(:household_token) }
    it { validate_presence_of(:location) }
  end
end
