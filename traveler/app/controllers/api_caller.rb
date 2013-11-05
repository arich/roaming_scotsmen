require 'httparty'
class ApiCaller
include HTTParty
debug_output $stdout

	def initialize
		self.class.default_params api_key: "q0X0eBgwsN965QIZcDMCfDvrAqoDLRuU"
		@base_url = "http://api.pearson.com/eyewitness"
	end

	format :json
	default_params output: 'json'

	def get_list_of_cities
		return ["New York", "Barcelona", "Paris"]
	end

	def get_categories_for_city city
		response = HTTParty.get("#{@base_url}/#{city}/categories.json")
	end

	def get_attractions_for_city city, query
		response = HTTParty.get("#{@base_url}/#{city}/block.json", query: query)
	end
end