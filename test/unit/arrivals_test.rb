require_relative '../../lib/transit/arrival'
require_relative '../lib/fixture'
require 'minitest/autorun'

include Fixture

describe 'Transit::Arrival' do

  describe 'Arrival with only Scheduled precision' do

    it 'must return false to has_realtime_estimate?' do
      arrival = Fixture.load_arrival(:scheduled)
      assert_equal(false, arrival.has_realtime_estimate?)
    end

  end

  describe 'Arrival with only Realtime Estimated precision' do

    it 'must return true to has_realtime_estimate?' do
      arrival = Fixture.load_arrival(:estimated)
      assert_equal(true, arrival.has_realtime_estimate?)
    end

    it 'must return the same value for .estimated and .realtime_estimate' do
      arrival = Fixture.load_arrival(:estimated)
      assert_equal(arrival.estimated, arrival.realtime_estimate)
    end

    it 'must return the correct value for .realtime_estimate' do
      require 'time'
      estimated_arrival_datetime = Time.now.iso8601
      arrival = Fixture.load_arrival(:estimated, {estimated: estimated_arrival_datetime})
      assert_equal(estimated_arrival_datetime, arrival.realtime_estimate)
    end

  end

end
