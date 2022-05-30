json.extract! paiement, :id, :amount, :customer_id, :abonnement_id, :token, :created_at, :updated_at
json.url paiement_url(paiement, format: :json)
