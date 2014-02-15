require 'sinatra'
require 'yaml'

here = Dir.pwd
require "#{here}/lib/transit/system.rb"
config = YAML.load_file("#{here}/config.yaml")

trimet = Transit::System.new(config)

helpers do
  # @param [String] time_string
  # @return [Integer] Number of Minutes
  def minutes_from_now(time_string)
    if(time_string.to_s != '')
      that_time = Time.parse(time_string)
      ((that_time - Time.now)/60).to_i
    end
  end

  def short_date(time_string)
    if(time_string.to_s != '')
      Time.parse(time_string).strftime('%a, %I:%M:%S %P')
    end
  end
end

get '/' do
  'Hello world!'
end

get '/stop/:location_id' do

  location_id = params[:location_id]
  stop = trimet.stop(location_id)

  erb :stop, :locals => {location: stop.location, arrivals: stop.arrivals}
end

