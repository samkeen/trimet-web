require 'net/http'
require_relative 'transit_errors'

module Transit
  require_relative 'stop'
  class System

    # @param [Hash] config
    def initialize(config)
      @config = config
      init
    end

    # @param [Integer] stop_id
    # @return [Stop]
    def stop(stop_id)
      stops_state = make_api_call(stop_id)
      Stop.new(stops_state)
    end

    private

    def init
      @base_uri = "#{@config['api_base_uri']}/#{@config['api_version']}/arrivals"
    end

    # @param [Integer] location_id
    def make_api_call(location_id)
      uri = URI(@base_uri)
      params = {
          :appID     => @config['api_key'],
          :locIDs    => location_id,
          :json      => @config['response_format'].downcase == 'json',
          :callback  => @config['callback'],
          :streetcar => @config['include_streetcar'],
      }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      if(res.is_a?(Net::HTTPSuccess))
        parsed = parse_response(res.body)['resultSet']
      end
      check_for_error(parsed)
      parsed
    end

    def parse_response(entity_body)
      case @config['response_format'].downcase
        when 'json'
          require 'json'
          JSON.parse(entity_body)
        when 'xml'
          throw('xml support not implemented')
        else
          throw("Unsupported format: '#{@config['response_type'].downcase}'")
      end
    end

    # @param [Hash] parsed_response
    def check_for_error(parsed_response)
      if parsed_response.has_key?('errorMessage')
        case parsed_response['errorMessage']['content']
          when /^Location id not found/i
            raise LocationIdNotFoundError, 'Trimet Location Id not found'
          when /^Couldn't parse location/i
            raise LocationIdNotParsableError, 'Trimet Location Id not pasable'
          else
            raise RuntimeError, 'Unexpected Error From Trimet API'
        end
      end
    end

  end
end
