# myapp.rb
require 'sinatra'

require 'json'
here = Dir.pwd
require "#{here}/lib/transit_system.rb"
config = JSON.parse( IO.read("#{here}/config.json") )

trimet = TransitSystem.new(config)

get '/' do
  'Hello world!'
end

get '/stop/:location_id' do

  location_id = params[:location_id]
  stop = trimet.stop(location_id)

  location = stop.location

  output = "<pre>For Transit stop: #{location['locid']} : #{location['desc']} (#{location['dir']})\n"

  stop.arrivals.each do |bus|
    output += "\t#{bus['shortSign']} will arrive at #{bus['estimated']}\n"
  end
  output
end

