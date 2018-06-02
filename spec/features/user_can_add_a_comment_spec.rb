require 'rails_helper'

RSpec.feature "Adding a comment", type: :feature do
  before(:each) do
    sign_up
    add_article
    add_comment
  end
  scenario "Can add a comment, which shows an email" do
    expect(page).to have_content("Example comment")
    expect(page).to have_content("example@example.com")
  end
end
