class Customer < ApplicationRecord
  has_one :abonnement
  has_many :paiements
end
