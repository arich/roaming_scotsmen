json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :description, :lat, :long
  json.url attraction_url(attraction, format: :json)
end
