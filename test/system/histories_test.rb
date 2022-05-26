require "application_system_test_case"

class HistoriesTest < ApplicationSystemTestCase
  setup do
    @history = histories(:one)
  end

  test "visiting the index" do
    visit histories_url
    assert_selector "h1", text: "Histories"
  end

  test "creating a History" do
    visit histories_url
    click_on "New History"

    fill_in "Abonnement", with: @history.abonnement_id
    fill_in "Amount", with: @history.amount
    fill_in "Payment mode", with: @history.payment_mode
    fill_in "Transaction", with: @history.transaction_id
    click_on "Create History"

    assert_text "History was successfully created"
    click_on "Back"
  end

  test "updating a History" do
    visit histories_url
    click_on "Edit", match: :first

    fill_in "Abonnement", with: @history.abonnement_id
    fill_in "Amount", with: @history.amount
    fill_in "Payment mode", with: @history.payment_mode
    fill_in "Transaction", with: @history.transaction_id
    click_on "Update History"

    assert_text "History was successfully updated"
    click_on "Back"
  end

  test "destroying a History" do
    visit histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "History was successfully destroyed"
  end
end
