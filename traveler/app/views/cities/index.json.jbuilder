json.array!(@cities) do |city|
  json.extract! city, :category
  json.url city_url(city, format: :json)
end
