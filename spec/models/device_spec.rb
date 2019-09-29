require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'association' do
    it { is_expected.to have_many :device_readings }
  end

  describe 'validations' do
    it { validate_presence_of(:temperature) }
    it { validate_presence_of(:tracking_number) }
    it { validate_presence_of(:humidity) }
    it { validate_presence_of(:battery_charge) }
  end
end
