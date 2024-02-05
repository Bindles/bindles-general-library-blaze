json.extract! item, :id, :name, :body, :access, :pass, :created_at, :updated_at
json.url item_url(item, format: :json)
