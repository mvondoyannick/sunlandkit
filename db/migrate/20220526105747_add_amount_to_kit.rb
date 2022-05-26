class AddAmountToKit < ActiveRecord::Migration[6.1]
  def change
    add_column :kits, :amount, :string
  end
end
