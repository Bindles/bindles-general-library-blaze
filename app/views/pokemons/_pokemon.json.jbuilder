json.extract! pokemon, :id, :name, :url, :category, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
