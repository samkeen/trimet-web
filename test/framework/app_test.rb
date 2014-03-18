ENV['RACK_ENV'] = 'test'

require_relative '../../app'
require 'minitest/autorun'
require 'rack/test'

require 'coveralls'
Coveralls.wear!

# @return [Rack::Test::Session]
def get_client
  Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
end

describe 'Trimet Transit App Endpoints' do

  describe 'The Stop Endpoint' do

    it 'must return 404 for /stop (not stop Id)' do
      browser = get_client
      browser.get '/stop'
      browser.last_response.status.must_equal 404
    end

    it 'must return 400 for non integer location id' do
      browser = get_client
      browser.get '/stop/wrong_id_format'
      browser.last_response.status.must_equal 400
    end

    it 'must return 404 for unknown integer location id' do
      browser = get_client
      browser.get '/stop/12345678999'
      browser.last_response.status.must_equal 404
    end

  end

end