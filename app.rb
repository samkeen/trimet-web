# myapp.rb
require 'sinatra'
require 'yaml'
here = Dir.pwd
require "#{here}/lib/transit_system.rb"
config = YAML.load_file("#{here}/config.yaml")

trimet = TransitSystem.new(config)

get '/' do
  'Hello world!'
end

get '/stop/:location_id' do

  location_id = params[:location_id]
  stop = trimet.stop(location_id)

  erb :stop, :locals => {location: stop.location, arrivals: stop.arrivals}
end

