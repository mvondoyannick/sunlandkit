class Paiement < ApplicationRecord
  belongs_to :customer
  belongs_to :abonnement

  before_save :generate_token, if: :new_record?

  before_destroy :notify_admin
  
  def generate_token
    self.token = SecureRandom.hex(10)

    # send notification email to admin
    
  end

  def notify_admin
    puts "send notification to idriss mongoue"
  end
end
