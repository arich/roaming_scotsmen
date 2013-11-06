class RomeController < ApplicationController

  def index
  	@api_caller = ApiCaller.new
    puts params
    query_hash = {}
    push_if_not_nil :q, query_hash
    push_if_not_nil :category, query_hash
    push_if_not_nil :lat, query_hash
    push_if_not_nil :long, query_hash
    query_hash[:tag] = :tg_info

    @attractions = @api_caller.get_attractions_for_city("rome", query_hash)["list"]["link"]

    @hash = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction["@latitude"]
      marker.lng attraction["@longitude"]
      marker.infowindow attraction["@title"]
    end

    @latlong= []
    @attractions.each do |attraction|
      @latlong.push({lat: attraction["@latitude"], lng: attraction["@longitude"]})
    end
  end


  def push_if_not_nil param, hash
    if not params[param].nil?
      hash[param] = params[param]
    end
  end
end
