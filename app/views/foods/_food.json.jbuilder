json.extract! food, :id, :name, :quantity, :price, :type, :created_at, :updated_at
json.url food_url(food, format: :json)
