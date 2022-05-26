require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Arrondissement", with: @customer.arrondissement
    fill_in "Cni", with: @customer.cni
    fill_in "Departement", with: @customer.departement
    fill_in "Latitude", with: @customer.latitude
    fill_in "Longitude", with: @customer.longitude
    fill_in "Name", with: @customer.name
    fill_in "Phone1", with: @customer.phone1
    fill_in "Phone2", with: @customer.phone2
    fill_in "Region", with: @customer.region
    fill_in "Second name", with: @customer.second_name
    fill_in "Sexe", with: @customer.sexe
    fill_in "Token", with: @customer.token
    fill_in "Ville", with: @customer.ville
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Arrondissement", with: @customer.arrondissement
    fill_in "Cni", with: @customer.cni
    fill_in "Departement", with: @customer.departement
    fill_in "Latitude", with: @customer.latitude
    fill_in "Longitude", with: @customer.longitude
    fill_in "Name", with: @customer.name
    fill_in "Phone1", with: @customer.phone1
    fill_in "Phone2", with: @customer.phone2
    fill_in "Region", with: @customer.region
    fill_in "Second name", with: @customer.second_name
    fill_in "Sexe", with: @customer.sexe
    fill_in "Token", with: @customer.token
    fill_in "Ville", with: @customer.ville
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
