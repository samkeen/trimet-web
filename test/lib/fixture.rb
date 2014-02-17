require 'json'

module Fixture
  @fixture_dir = File.realpath('../fixtures', File.dirname(__FILE__))
  @app_class_dir = File.realpath('../../lib', File.dirname(__FILE__))

  # @param [Symbol] fixture_name
  # @return [Transit::Arrival]
  # @param [Hash] overrides This hash will be merged with the loaded fixture (overriding
  #               fixture values)
  def load_arrival(fixture_name, overrides={})
    state = load_fixture_file('arrival', fixture_name.to_s)
    state.merge!(overrides)
    Transit::Arrival.new(state)
  end

  private

  # @param [String] type e.g. 'arrival'
  # @param [String] fixture_name e.g. 'schedule', 'estimated'
  # @return [Hash]
  def load_fixture_file(type, fixture_name)
    type.downcase!
    require "#{@app_class_dir}/transit/#{type}.rb"
    fixture_name = fixture_name.gsub(/\..*$/, '').concat('.json')
    JSON.parse(File.read("#{@fixture_dir}/#{type}/#{fixture_name}"))
  end

end
