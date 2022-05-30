class Paiement < ApplicationRecord
  belongs_to :customer
  belongs_to :abonnement
end
