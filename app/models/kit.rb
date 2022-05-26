class Kit < ApplicationRecord
  has_many :codes
  # belongs_to :abonnement
  validates :name, presence: true
  validates :code_barre, presence: true

  after_create :set_token

  def set_token
    self.token = "kit_#{SecureRandom.uuid}_sunland"
  end
end
