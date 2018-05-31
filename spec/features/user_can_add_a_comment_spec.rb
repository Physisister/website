require 'rails_helper'

RSpec.feature "Adding a comment", type: :feature do
  scenario "Can add a comment, which shows an email" do
    sign_up
    add_article
    fill_in "comment[content]", with: "Example comment"
    click_button "New Comment"
    expect(page).to have_content("Example comment")
    expect(page).to have_content("example@example.com")
  end
end
