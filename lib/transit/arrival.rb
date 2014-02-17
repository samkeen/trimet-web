require_relative '../view_object'

module Transit
  class Arrival < ViewObject

    #alias :realtime_estimate :estimated

    # @return [Boolean]
    def has_realtime_estimate?
      self.status.downcase == 'estimated'
    end

    #### ALIASES (alias_method does not seem to work with OpenStruct)


    # @return [String] iso8601 DateTime as String
    def realtime_estimate
      self.estimated
    end

  end
end
