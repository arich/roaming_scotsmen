require 'rest-client'

API_KEY = "q0X0eBgwsN965QIZcDMCfDvrAqoDLRuU"
response = RestClient.get(
			"http://api.pearson.com/eyewitness/newyork/block.json?apikey=#{API_KEY}"
			)
puts response