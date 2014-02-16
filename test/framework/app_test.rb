ENV['RACK_ENV'] = 'test'

require_relative '../../app'
require 'minitest/autorun'
require 'rack/test'

class AppTest < MiniTest::Unit::TestCase

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    browser = get_client
    browser.get '/'
    assert browser.last_response.ok?
    assert_equal 'Hello world!', browser.last_response.body
  end

  def test_slash_stop_is_404
    browser = get_client
    browser.get '/stop'
    assert browser.last_response.not_found?
  end

  private

  # @return [Rack::Test::Session]
  def get_client
    Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
  end
end