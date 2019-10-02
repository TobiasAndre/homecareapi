# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '=================================================================='
d = Device.create(location: 'Besselstraße 14, 10969 Berlin, Deutschland')
puts 'Token: ( ' + d.household_token + ' ) Location=( ' + d.location + ' )'
d = Device.create(location: 'Krausenstraße 21, 10117 Berlin, Deutschland')
puts 'Token: ( ' + d.household_token + ' ) Location=( ' + d.location + ' )'
d = Device.create(location: 'Leipziger Str. 42, 10117 Berlin, Deutschland')
puts 'Token: ( ' + d.household_token + ' ) Location=( ' + d.location + ' )'
d = Device.create(location: 'Behrenstraße 55-57, 10117 Berlin, Deutschland')
puts 'Token: ( ' + d.household_token + ' ) Location=( ' + d.location + ' )'
puts '=================================================================='
