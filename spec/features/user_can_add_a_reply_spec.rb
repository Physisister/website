require 'rails_helper'

RSpec.feature "Adding a reply", type: :feature do
  scenario "Can add a reply" do
    sign_up
    add_article
    add_comment
    fill_in "reply[content]", with: "Example reply"
    click_button "New Reply"
    expect(page).to have_content("Example reply")
  end
end
