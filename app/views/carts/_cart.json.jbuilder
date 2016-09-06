json.extract! cart, :id, :user_id, :book_id, :value, :created_at, :updated_at
json.url cart_url(cart, format: :json)