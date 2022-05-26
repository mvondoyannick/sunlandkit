require "application_system_test_case"

class AbonnementsTest < ApplicationSystemTestCase
  setup do
    @abonnement = abonnements(:one)
  end

  test "visiting the index" do
    visit abonnements_url
    assert_selector "h1", text: "Abonnements"
  end

  test "creating a Abonnement" do
    visit abonnements_url
    click_on "New Abonnement"

    check "Active" if @abonnement.active
    fill_in "Customer", with: @abonnement.customer_id
    fill_in "Kit", with: @abonnement.kit_id
    click_on "Create Abonnement"

    assert_text "Abonnement was successfully created"
    click_on "Back"
  end

  test "updating a Abonnement" do
    visit abonnements_url
    click_on "Edit", match: :first

    check "Active" if @abonnement.active
    fill_in "Customer", with: @abonnement.customer_id
    fill_in "Kit", with: @abonnement.kit_id
    click_on "Update Abonnement"

    assert_text "Abonnement was successfully updated"
    click_on "Back"
  end

  test "destroying a Abonnement" do
    visit abonnements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Abonnement was successfully destroyed"
  end
end
