class AddPuissanceToKit < ActiveRecord::Migration[6.1]
  def change
    add_column :kits, :puissance, :string
    add_column :kits, :couleur, :string
    add_column :kits, :poids, :string
  end
end
