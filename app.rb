require 'sinatra'
require 'yaml'

here = File.dirname(__FILE__)
require "#{here}/lib/transit/system.rb"
require "#{here}/lib/transit/transit_errors.rb"
require "#{here}/lib/datetime_helper.rb"
config = YAML.load_file("#{here}/config.yml")

trimet = Transit::System.new(config)

helpers DatetimeHelper

get '/' do
  'Hello world!'
end

get '/stop/:location_id' do

  location_id = params[:location_id]
  begin
    stop = trimet.stop(location_id)
  rescue Transit::LocationIdNotFoundError => e
    halt 404, 'Location Id Not Found'
  rescue Transit::LocationIdNotParsableError => e
    halt 400, 'Location Id in unknown format'
  rescue Exception => e
    halt 500, 'Something unexpected happened'
  end

  erb :stop, :locals => {location: stop.location, arrivals: stop.arrivals}
end

