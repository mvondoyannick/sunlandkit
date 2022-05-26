json.extract! customer, :id, :name, :second_name, :cni, :phone1, :phone2, :region, :ville, :departement, :arrondissement, :latitude, :longitude, :sexe, :token, :created_at, :updated_at
json.url customer_url(customer, format: :json)
