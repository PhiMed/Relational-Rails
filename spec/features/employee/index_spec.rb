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

    expect(page).to have_content(employee.id)
    expect(page).to have_content(employee.name)
    expect(page).to have_content(employee.weekly_hours)
    expect(page).to have_content(employee.over_21)
    expect(page).to have_content(employee.restaurant_id)
    expect(page).to have_content(employee.created_at)
    expect(page).to have_content(employee.updated_at)

    expect(page).to_not have_content("Jane Doe")

    click_link "#{employee.name}"

    expect(current_path).to eq("/employee/#{employee.id}")
  end

  it 'provides link to add new employee' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/employee"
    expect(page).to have_link("Add New Employee")

    click_link "Add New Employee"
    expect(current_path).to eq('/employee/new')
  end

  it 'provides links for employee, restaurant, welcome indexes' do

    visit "/employee"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
    expect(page).to have_link("Welcome Index")
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

    visit "/employee"
    expect(page).to have_link("Update Employee")

    click_link "Update Employee"
    expect(current_path).to eq("/employee/#{employee.id}/edit")

    fill_in "employee[name]", with: "Jane Dow"
    fill_in "employee[weekly_hours]", with: "35"
    fill_in "employee[over_21]", with: "false"
    fill_in "employee[restaurant_id]", with: "#{restaurant_2.id}"
    click_button "Update Employee"

    expect(current_path).to eq("/employee/#{employee.id}")
  end
end
