class CreateCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :codes do |t|
      t.string :cle
      t.string :validite
      t.references :kit, null: true, foreign_key: true

      t.timestamps
    end
  end
end
