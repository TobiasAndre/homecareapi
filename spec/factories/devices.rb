FactoryBot.define do
  factory :device do
    household_token { Faker::Number.number(digits: 10) }
    location { FFaker::AddressDE.street_address }
  end
end
