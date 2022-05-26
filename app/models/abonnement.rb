class Abonnement < ApplicationRecord
  belongs_to :customer
  belongs_to :kit
end
