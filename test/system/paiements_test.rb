require "application_system_test_case"

class PaiementsTest < ApplicationSystemTestCase
  setup do
    @paiement = paiements(:one)
  end

  test "visiting the index" do
    visit paiements_url
    assert_selector "h1", text: "Paiements"
  end

  test "creating a Paiement" do
    visit paiements_url
    click_on "New Paiement"

    fill_in "Abonnement", with: @paiement.abonnement_id
    fill_in "Amount", with: @paiement.amount
    fill_in "Customer", with: @paiement.customer_id
    fill_in "Token", with: @paiement.token
    click_on "Create Paiement"

    assert_text "Paiement was successfully created"
    click_on "Back"
  end

  test "updating a Paiement" do
    visit paiements_url
    click_on "Edit", match: :first

    fill_in "Abonnement", with: @paiement.abonnement_id
    fill_in "Amount", with: @paiement.amount
    fill_in "Customer", with: @paiement.customer_id
    fill_in "Token", with: @paiement.token
    click_on "Update Paiement"

    assert_text "Paiement was successfully updated"
    click_on "Back"
  end

  test "destroying a Paiement" do
    visit paiements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paiement was successfully destroyed"
  end
end
