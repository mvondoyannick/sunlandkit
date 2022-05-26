class CreateKits < ActiveRecord::Migration[6.1]
  def change
    create_table :kits do |t|
      t.string :name
      t.string :code_barre

      t.timestamps
    end
  end
end
