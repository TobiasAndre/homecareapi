FactoryBot.define do
  factory :device do
    household_token { "GZmN5YmGKUdabX9MiysHaswR" }
    location { FFaker::AddressDE.street_address }
  end
end
