class CreatePaiements < ActiveRecord::Migration[6.1]
  def change
    create_table :paiements do |t|
      t.string :amount
      t.references :customer, null: true, foreign_key: true
      t.references :abonnement, null: true, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
