require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'edits an employee' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/employees/#{employee.id}/edit"
    fill_in "employee[name]", with: "Jim Bob"
    fill_in "employee[weekly_hours]", with: "40"
    fill_in "employee[over_21]", with: "true"
    fill_in "employee[restaurant_id]", with: "#{restaurant.id}"
    click_on "Update Employee"

    expect(page).to have_content("Jim Bob")
    expect(current_path).to eq("/employees/#{employee.id}")
    expect(page).to_not have_content("Mary Takanaka")
  end
end
