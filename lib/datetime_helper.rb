module DatetimeHelper

  # @param [String] time_string
  # @return [Integer] Number of Minutes
  def minutes_from_now(time_string)
    if(time_string.to_s != '')
      that_time = Time.parse(time_string)
      ((that_time - Time.now)/60).to_i
    end
  end

  # @param [String] time_string
  # @return [String]
  def short_date(time_string)
    if(time_string.to_s != '')
      Time.parse(time_string).strftime('%a, %I:%M:%S %P')
    end
  end
end