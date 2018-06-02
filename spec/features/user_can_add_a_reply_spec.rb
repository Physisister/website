require 'rails_helper'

RSpec.feature "Adding a reply", type: :feature do
  before(:each) do
    sign_up
    add_article
    add_comment
    add_reply
  end
  scenario "Can add a reply" do
    expect(page).to have_content("Example reply")
  end
end
