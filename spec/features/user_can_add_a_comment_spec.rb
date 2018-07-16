require 'rails_helper'

RSpec.feature "Adding a comment", type: :feature do
  before(:each) do
    create_user
    sign_in
    add_article
    add_comment
  end
  scenario "Can add a comment, which shows an email" do
    expect(page).to have_content("Example comment")
    expect(page).to have_content("example_username")
  end
end
