require 'rails_helper'

RSpec.describe 'restaurant employee index' do
  it 'shows all employees of restaurants' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = restaurant.employees.create(name: "Bob Smith",
                                            weekly_hours: 40,
                                            over_21: true,
                                            restaurant_id: restaurant.id)

    visit "/restaurant/#{restaurant.id}/employee"

    expect(page).to have_content(employee.name)
    expect(page).to have_content(employee.weekly_hours)
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant/#{restaurant.id}/employee"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
