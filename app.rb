require 'sinatra'
require 'yaml'

this_dir = File.dirname(__FILE__)
require "#{this_dir}/lib/transit/system.rb"
require "#{this_dir}/lib/transit/transit_errors.rb"
require "#{this_dir}/lib/datetime_helper.rb"
config = YAML.load_file("#{this_dir}/config.yml")



helpers DatetimeHelper

get '/' do
  erb :home
end

get '/stop/:location_id' do
  trimet = Transit::System.new(config)

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
