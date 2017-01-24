json.extract! request, :id, :product_name, :store_name, :description, :est_price, :delivery_location, :to_id, :created_at, :updated_at
json.url request_url(request, format: :json)