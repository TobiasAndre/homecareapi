require 'rails_helper'

RSpec.describe 'Request devices controller', type: :request do
  let(:device){create(:device)}

  describe '#show /v1/devices' do
    context 'not authorized request' do
      before { get '/api/v1/devices', params: {}, headers: nil }
      
      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'authorized request' do
      before { get '/api/v1/devices', params: {}, headers: { 'Authorization': 'Bearer '+device.household_token } }
      
      it 'returns client Group and status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
end