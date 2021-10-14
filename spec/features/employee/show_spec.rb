require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'displays employee attributes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/employee/#{employee.id}"

    expect(page).to have_content(employee.id)
    expect(page).to have_content(employee.restaurant_id)
    expect(page).to_not have_content("Taco Bell")
  end
end
