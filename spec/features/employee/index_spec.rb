require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'displays index' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/employee"

    expect(page).to have_content(employee.name)
    expect(page).to_not have_content("Jane Doe")
  end
end
