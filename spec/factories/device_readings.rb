# frozen_string_literal: true

FactoryBot.define do
  factory :device_reading do
    tracking_number { Faker::Number.number(digits: 4) }
    temperature { Faker::Number.decimal(l_digits: 2) }
    humidity { Faker::Number.decimal(l_digits: 2) }
    battery_charge { Faker::Number.decimal(l_digits: 2) }
    device
  end
end
