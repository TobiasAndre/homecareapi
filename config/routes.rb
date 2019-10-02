# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'

  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

  namespace :api do
    namespace :v1 do
      get 'devices', to: 'devices#show'
      post 'device_readings', to: 'device_readings#create'
      get 'device_readings', to: 'device_readings#reading_by_tracking_number'
      get 'device_stats', to: 'device_readings#device_stats'
    end
  end
end
