module ApplicationHelper
  # format money
  def self.format_money(money)
    ActionController::Base.helpers.number_to_currency(money, locale: :fr, unit: "F", separator: ",", delimiter: ".", format: "%n %u")
  end

  # formate datetime
  def self.format_date(date)
    date.strftime('%d %h %Y - %HH:%Mm')
  end

  # generate paiement percentage
  # @param String total_amount
  # @param String paiement
  def self.generate_percentage(total_amount, paiements)
    "#{((paiements.to_f / total_amount.to_f)*100).round(2)}%"
  end
end
