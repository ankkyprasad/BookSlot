json.extract! event, :id, :name, :location, :description, :color, :duration, :payment_required, :price, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
json.description event.description.to_s
