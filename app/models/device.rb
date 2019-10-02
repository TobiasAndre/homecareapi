# frozen_string_literal: true

class Device < ApplicationRecord

  has_secure_token :household_token
  has_many :device_readings

end
