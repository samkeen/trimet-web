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

  erb :stop, :locals => {location: stop.location, arrivals: stop.arrivals}
end

