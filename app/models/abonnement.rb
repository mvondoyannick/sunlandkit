class Abonnement < ApplicationRecord
  belongs_to :customer
  belongs_to :kit
  has_many :paiements

  validates :kit_id, presence: true, uniqueness: {message: "Ce kit est déja attribué à un client"}
  validates :customer_id, presence: true

  before_save :generate_token, if: :new_record?

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
