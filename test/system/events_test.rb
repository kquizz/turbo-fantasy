require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:first)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h2", text: "Events"
  end

  test "showing an event" do
    visit events_url
    assert_selector "h2", text: "Events"

    click_on "Show", match: :first
    assert_selector "h2", text: @event.title
  end
  

  test "creating an event" do
    visit events_url
    assert_selector "h2", text: "Events"

    click_on "New Event"
    assert_selector "h2", text: "New Event"

    fill_in "Name", with: "Capybara Event"
    click_on "Create Event"

    assert_selector "h2", text: "Events"
    assert_text "Event was successfully created"
  end

  test "updating an event" do
    visit events_url
    assert_selector "h2", text: "Events"

    click_on "Show", match: :first
    assert_selector "h2", text: "Edit Event"

    fill_in "Name", with: "Capybara Event"
    click_on "Update Event"

    assert_selector "h2", text: "Events"
    assert_text "Event was successfully updated"
  end
end
