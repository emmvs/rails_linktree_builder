require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:first) # Reference to the first fixture link
  end

  test "Creating a new link" do
    # When we visit the links#index page
    # we expect to see a title with the text "links"
    visit dashboard_path
    assert_selector "h1", text: "links"

    # When we click on the link with the text "New link"
    # we expect to land on a page with the title "New link"
    click_on "New link"
    assert_selector "h1", text: "New link"

    # When we fill in the name input with "Capybara link"
    # and we click on "Create link"
    fill_in "Name", with: "Capybara link"
    click_on "Create link"

    # We expect to be back on the page with the title "links"
    # and to see our "Capybara link" added to the list
    assert_selector "h1", text: "links"
    assert_text "Capybara link"
  end
end
