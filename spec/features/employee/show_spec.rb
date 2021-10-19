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

    visit "/employees/#{employee.id}"

    expect(page).to have_content(employee.id)
    expect(page).to have_content(employee.restaurant_id)
    expect(page).to have_content(employee.weekly_hours)
    expect(page).to have_content(employee.over_21)
    expect(page).to_not have_content("Jim Mendoza")
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant.id)

    visit "/employees/#{employee.id}"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
    expect(page).to have_link("Welcome Index")
  end

  it 'deletes a employee instance' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    employee_1 = restaurant.employees.create!(name: "Joe Smith",
                                              weekly_hours: 40,
                                              over_21: true,
                                              restaurant_id: restaurant.id)
    employee_2 = restaurant.employees.create!(name: "Jane Doe",
                                              weekly_hours: 30,
                                              over_21: true,
                                              restaurant_id: restaurant.id)

    visit "/employees/#{employee_1.id}"

    expect(page).to have_button("Delete Employee")

    click_button "Delete Employee"

    expect(current_path).to eq('/employees')
    expect(page).to_not have_content("Joe Smith")
    expect(page).to have_content("Jane Doe")
  end
end
