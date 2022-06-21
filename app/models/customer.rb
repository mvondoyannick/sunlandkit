class Customer < ApplicationRecord
  has_one :abonnement
  has_many :paiements

  before_create :generate_token

  def generate_token
    self.token = "cus_sunland_#{SecureRandom.hex(5)}_#{Date.today.year.to_s.split("0").last}"
  end

  def complete_name
    "#{self.name.upcase} #{self.second_name}"
  end
end
