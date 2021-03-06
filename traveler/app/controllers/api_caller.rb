class ApiCaller < ApplicationController
  include HTTParty
  def initialize
    self.class.default_params api_key: "XbLv4GK8Nu2RLthAtNiDFqsKrLb9Ygkp"
    @base_url = "http://api.pearson.com/eyewitness"
    #don't know why the base_uri method isn't working, but it's an easy workaround.
  end

  def get_list_of_cities
    return ["New York", "Barcelona", "Paris"]
  end

  def get_categories_for_city city
    response = HTTParty.get("#{@base_url}/#{city}/categories.json")
  end

  def get_attractions_for_city city, query
    response = HTTParty.get("#{@base_url}/#{city}/block.json", query: query)
  end

  def get_attraction_detail city, id
    response = HTTParty.get("#{@base_url}/#{city}/block/#{id}.json")
  end
end