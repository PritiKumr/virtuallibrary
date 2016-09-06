json.extract! book, :id, :sku, :name, :price, :author, :publication, :created_at, :updated_at
json.url book_url(book, format: :json)