json.extract! vehicle, :id, :name, :price, :category_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
