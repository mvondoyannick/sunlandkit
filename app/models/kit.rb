class Kit < ApplicationRecord
  has_many :codes
  has_one :abonnement
  # belongs_to :abonnement
  validates :name, presence: true
  validates :code_barre, presence: true

  after_create :set_token

  def set_token
    self.token = "kit_#{SecureRandom.uuid}_sunland"
  end
end
