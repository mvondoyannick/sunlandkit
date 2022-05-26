class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :abonnement, null: true, foreign_key: true
      t.string :amount
      t.string :transaction_id
      t.string :payment_mode

      t.timestamps
    end
  end
end
