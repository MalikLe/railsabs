require "application_system_test_case"

class WeeksTest < ApplicationSystemTestCase
  setup do
    @week = weeks(:one)
  end

  test "visiting the index" do
    visit weeks_url
    assert_selector "h1", text: "Weeks"
  end

  test "creating a Week" do
    visit weeks_url
    click_on "New Week"

    fill_in "End date", with: @week.end_date
    fill_in "Num", with: @week.num
    fill_in "Start date", with: @week.start_date
    click_on "Create Week"

    assert_text "Week was successfully created"
    click_on "Back"
  end

  test "updating a Week" do
    visit weeks_url
    click_on "Edit", match: :first

    fill_in "End date", with: @week.end_date
    fill_in "Num", with: @week.num
    fill_in "Start date", with: @week.start_date
    click_on "Update Week"

    assert_text "Week was successfully updated"
    click_on "Back"
  end

  test "destroying a Week" do
    visit weeks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Week was successfully destroyed"
  end
end
