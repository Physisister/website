require 'rails_helper'

RSpec.feature "Navigation", type: :feature do
  before(:each) do
    create_user
    sign_in
  end
  scenario "Can visit the Blog from the homepage" do
    visit "/"
    click_link "Blog"
    expect(page).to have_current_path("/articles")
  end
  scenario "Can visit Home from the blog page" do
    visit "/articles"
    click_link "Home"
    expect(page).to have_current_path("/home/index")
  end
end
