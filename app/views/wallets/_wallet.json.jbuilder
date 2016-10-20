json.extract! wallet, :id, :user_id, :amount, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)