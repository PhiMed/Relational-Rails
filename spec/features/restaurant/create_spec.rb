require 'rails_helper'

RSpec.describe "restaurant", type: :feature do
  it 'creates a new restaurant' do
    visit "/restaurant/new"
    fill_in "restaurant[name]", with: "Taco Bell"
    fill_in "restaurant[seats]", with: "12"
    fill_in "restaurant[serve_liquor]", with: "false"
    click_on "Submit"

    expect(page).to have_content("Taco Bell")
    expect(page).to_not have_content("Mary Takanaka")
  end
end
