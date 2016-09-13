json.extract! book_catalog, :id, :book_id, :catalog, :created_at, :updated_at
json.url book_catalog_url(book_catalog, format: :json)