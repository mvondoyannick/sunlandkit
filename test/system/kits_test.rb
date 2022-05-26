require "application_system_test_case"

class KitsTest < ApplicationSystemTestCase
  setup do
    @kit = kits(:one)
  end

  test "visiting the index" do
    visit kits_url
    assert_selector "h1", text: "Kits"
  end

  test "creating a Kit" do
    visit kits_url
    click_on "New Kit"

    fill_in "Code barre", with: @kit.code_barre
    fill_in "Name", with: @kit.name
    click_on "Create Kit"

    assert_text "Kit was successfully created"
    click_on "Back"
  end

  test "updating a Kit" do
    visit kits_url
    click_on "Edit", match: :first

    fill_in "Code barre", with: @kit.code_barre
    fill_in "Name", with: @kit.name
    click_on "Update Kit"

    assert_text "Kit was successfully updated"
    click_on "Back"
  end

  test "destroying a Kit" do
    visit kits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kit was successfully destroyed"
  end
end
