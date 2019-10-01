require 'rails_helper'

RSpec.describe 'Request device readings controller', type: :request do
  let(:device){create(:device)}

  describe 'getting device readings' do
    context 'not authorized request' do
      before { get '/api/v1/device_readings', params: {}, headers: nil }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
    
    context 'authorized request' do
      before { get '/api/v1/device_readings', params: {}, headers: { 'Authorization': 'Bearer '+device.household_token } }

      it 'returns device readings and status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'getting device stats' do
    context 'not authorized request' do
      before { get '/api/v1/device_stats', params: {}, headers: nil }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
    
    context 'authorized request but no data found' do
      before { get '/api/v1/device_stats', params: {}, headers: { 'Authorization': 'Bearer '+device.household_token } }

      it 'returns 404 if device not contains data' do
        expect(response).to have_http_status(404)
      end
    end

    context 'authorized request and data found' do
      let(:device_reading){create(:device_reading)}
      before { get '/api/v1/device_stats', params: {}, headers: { 'Authorization': 'Bearer '+device_reading.device.household_token } }

      it 'returns device stats and status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'saving device readings' do
    context 'not authorized request' do
      before { post '/api/v1/device_readings', params: {}, headers: nil }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'authorized request' do
      before { post '/api/v1/device_readings', params: {}, headers: { 'Authorization': 'Bearer '+device.household_token } }

      it 'returns device stats and status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end