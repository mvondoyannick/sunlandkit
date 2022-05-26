class Abonnement < ApplicationRecord
  belongs_to :customer
  belongs_to :kit
  has_many :histories
end
