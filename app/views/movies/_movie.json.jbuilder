json.extract! movie, :id, :name, :category, :desc, :created_at, :updated_at
json.url movie_url(movie, format: :json)
