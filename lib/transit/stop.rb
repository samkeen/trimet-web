require_relative 'arrival'
module Transit
  class Stop

    def initialize(current_state)
      @state = current_state
    end

    # @return [Hash]
    def location
      @state['location'][0]
    end

    # @return [Array]
    def arrivals
      arrivals = []
      unless @state['arrival'].nil?
        @state['arrival'].each do |arrival|
          arrivals.push(Arrival.new(arrival, :shortSign))
        end
      end
      arrivals
    end

  end
end
