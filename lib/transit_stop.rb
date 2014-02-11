class TransitStop
  def initialize(current_state)
    @state = current_state
  end

  # @return [Hash]
  def location
    @state['location'][0]
  end

  # @return [Array]
  def arrivals
    @state['arrival']
  end
end