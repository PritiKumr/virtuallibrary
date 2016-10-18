json.extract! return_request, :id, :user_id, :order_id, :status, :created_at, :updated_at
json.url return_request_url(return_request, format: :json)