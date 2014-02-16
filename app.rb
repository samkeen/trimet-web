require 'sinatra'
require 'yaml'

here = File.dirname(__FILE__)
require "#{here}/lib/transit/system.rb"
require "#{here}/lib/datetime_helper.rb"
config = YAML.load_file("#{here}/config.yaml")

trimet = Transit::System.new(config)

helpers DatetimeHelper

get '/' do
  'Hello world!'
end

get '/stop/:location_id' do

  location_id = params[:location_id]
  stop = trimet.stop(location_id)

  erb :stop, :locals => {location: stop.location, arrivals: stop.arrivals}
end

