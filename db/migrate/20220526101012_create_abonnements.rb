class CreateAbonnements < ActiveRecord::Migration[6.1]
  def change
    create_table :abonnements do |t|
      t.references :customer, null: true, foreign_key: true
      t.references :kit, null: true, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
