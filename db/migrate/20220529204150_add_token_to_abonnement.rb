class AddTokenToAbonnement < ActiveRecord::Migration[6.1]
  def change
    add_column :abonnements, :token, :string
  end
end
