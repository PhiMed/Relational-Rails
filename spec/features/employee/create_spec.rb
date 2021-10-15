require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'creates a new employee' do
    visit "/employee/new"
    fill_in "employee[name]", with: "Joe Smith"
    fill_in "employee[weekly_hours]", with: "40"
    fill_in "employee[over_21]", with: "false"
    fill_in "employee[restaurant_id]", with: "1"
    click_on "Submit"

    expect(page).to have_content("Joe Smith")
    expect(page).to have_content("40")
    expect(page).to have_content("false")
    expect(page).to_not have_content("Mary Takanaka")
  end
end
