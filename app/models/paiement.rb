class Paiement < ApplicationRecord
  belongs_to :customer
  belongs_to :abonnement

  before_save :generate_token, if: :new_record?
  
  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
