json.extract! order_food, :id, :food_id, :ticket_id, :created_at, :updated_at
json.url order_food_url(order_food, format: :json)
