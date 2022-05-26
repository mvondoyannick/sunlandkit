class AddTokenToKit < ActiveRecord::Migration[6.1]
  def change
    add_column :kits, :token, :string
  end
end
