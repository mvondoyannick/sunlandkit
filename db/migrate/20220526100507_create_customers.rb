class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :second_name
      t.string :cni
      t.string :phone1
      t.string :phone2
      t.string :region
      t.string :ville
      t.string :departement
      t.string :arrondissement
      t.string :latitude
      t.string :longitude
      t.string :sexe
      t.string :token

      t.timestamps
    end
  end
end
