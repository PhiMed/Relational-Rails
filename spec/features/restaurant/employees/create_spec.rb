require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'creates a new employee' do
    restaurant = Restaurant.create(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant/#{restaurant.id}/employee/new"
    fill_in "employee[name]", with: "Joe Smith"
    fill_in "employee[weekly_hours]", with: "40"
    fill_in "employee[over_21]", with: "false"
    fill_in "employee[restaurant_id]", with: "#{restaurant.id}"
    click_on "Create Employee"


    expect(current_path).to eq("/restaurant/#{restaurant.id}/employee")
    expect(page).to have_content("Joe Smith")
    expect(page).to have_content("40")
    expect(page).to have_content("false")
    expect(page).to_not have_content("Mary Takanaka")
  end
end
