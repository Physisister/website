require 'rails_helper'

RSpec.feature "Adding a reply", type: :feature do
  scenario "Can add a reply" do
    sign_up
    add_article
    add_comment
    add_reply
    expect(page).to have_content("Example reply")
  end
end
