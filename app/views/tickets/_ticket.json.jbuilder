json.extract! ticket, :id, :table, :final_price, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
