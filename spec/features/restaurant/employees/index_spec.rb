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

    visit "/restaurants/#{restaurant.id}/employees"

    expect(page).to have_content(employee.name)
    expect(page).to have_content(employee.weekly_hours)
    expect(page).to have_content(employee.over_21)
    expect(page).to have_content(employee.restaurant_id)
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants/#{restaurant.id}/employees"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end

  it 'provides link to create restaurant employee' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants/#{restaurant.id}/employees"

    expect(page).to have_link("Create Employee")

    click_link "Create Employee"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/employees/new")
  end

  it 'gives link to edit each employee' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/employees"
    expect(page).to have_link("Update Employee")

    click_link "Update Employee"
    expect(current_path).to eq("/employees/#{employee.id}/edit")

    fill_in "employee[name]", with: "Jane Dow"
    fill_in "employee[weekly_hours]", with: "35"
    fill_in "employee[over_21]", with: "false"
    fill_in "employee[restaurant_id]", with: "#{restaurant_2.id}"
    click_button "Update Employee"

    expect(current_path).to eq("/employees/#{employee.id}")
  end
end
