require 'rails_helper'

RSpec.feature "Deleting a comment", type: :feature do
  before(:each) do
    sign_up
    add_article
    add_comment
    click_button "Delete"
  end
  scenario "Can delete a comment" do
    expect(page).not_to have_content("Example comment")
  end
end
