json.array!(@attractions) do |attraction|
  json.id attraction["@id"]
  json.title attraction["@title"]
  json.parent attraction["@parent"]
  json.type attraction["@type"]
  json.tag attraction["@tag"]
  json.categories attraction["@categories"]
  json.lat attraction["@latitude"]
  json.long attraction["@longitude"]

  json.url attraction_url(attraction, format: :json)
end
