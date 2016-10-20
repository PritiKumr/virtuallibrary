json.extract! bookmark, :id, :user_id, :book_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)