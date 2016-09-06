json.extract! plan, :id, :name, :fee, :security, :no_book, :max_book, :max_price, :created_at, :updated_at
json.url plan_url(plan, format: :json)