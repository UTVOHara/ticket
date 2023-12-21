require "application_system_test_case"

class TicksTest < ApplicationSystemTestCase
  setup do
    @tick = ticks(:one)
  end

  test "visiting the index" do
    visit ticks_url
    assert_selector "h1", text: "Ticks"
  end

  test "should create tick" do
    visit ticks_url
    click_on "New tick"

    fill_in "Description", with: @tick.description
    fill_in "Name", with: @tick.name
    fill_in "Price", with: @tick.price
    fill_in "Time", with: @tick.time
    click_on "Create Tick"

    assert_text "Tick was successfully created"
    click_on "Back"
  end

  test "should update Tick" do
    visit tick_url(@tick)
    click_on "Edit this tick", match: :first

    fill_in "Description", with: @tick.description
    fill_in "Name", with: @tick.name
    fill_in "Price", with: @tick.price
    fill_in "Time", with: @tick.time
    click_on "Update Tick"

    assert_text "Tick was successfully updated"
    click_on "Back"
  end

  test "should destroy Tick" do
    visit tick_url(@tick)
    click_on "Destroy this tick", match: :first

    assert_text "Tick was successfully destroyed"
  end
end
