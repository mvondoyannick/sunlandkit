json.extract! history, :id, :abonnement_id, :amount, :transaction_id, :payment_mode, :created_at, :updated_at
json.url history_url(history, format: :json)
