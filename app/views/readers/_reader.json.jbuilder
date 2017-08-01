json.extract! reader, :id, :name, :created_at, :updated_at
json.url reader_url(reader, format: :json)
