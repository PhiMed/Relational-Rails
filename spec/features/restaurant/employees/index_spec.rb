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

    fill_in "name", with: "Mary Tanaka"
    fill_in "weekly_hours", with: "40"
    fill_in "over_21", with: "true"
    fill_in "restaurant_id", with: "#{restaurant.id}"
    click_button "Create Employee"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/employees")

    expect(page).to have_content("Mary Tanaka")
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

  it 'deletes a restaurant employee instance' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    employee_1 = restaurant.employees.create!(name: "Joe Smith",
                                              weekly_hours: 40,
                                              over_21: true,
                                              restaurant_id: restaurant.id)

    visit "/restaurants/#{restaurant.id}/employees"

    expect(page).to have_button("Delete Employee")

    click_button "Delete Employee"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/employees")
    expect(page).to_not have_content("Joe Smith")
  end

  it 'sorts restaurant employees by name alphabetically' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant_1.id)
    employee_2 = Employee.create!(name: "Latoya Jones",
                                weekly_hours: 45,
                                over_21: false,
                                restaurant_id: restaurant_1.id)

    visit "/restaurants/#{restaurant_1.id}/employees"

    expect(page).to have_link("Sort Employees Alphabetically")

    click_link "Sort Employees Alphabetically"

    expect(restaurant_1.employee_sort.first).to eq(employee)
    expect(restaurant_1.employee_sort.first).to_not eq(employee_2)
  end

  it 'finds and displays records over a threshold' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant_1.id)
    employee_2 = Employee.create!(name: "Latoya Jones",
                                weekly_hours: 45,
                                over_21: false,
                                restaurant_id: restaurant_1.id)
    employee_3 = Employee.create!(name: "Ricky Gonzales",
                                weekly_hours: 39,
                                over_21: true,
                                restaurant_id: restaurant_1.id)

    visit "/restaurants/#{restaurant_1.id}/employees"

    expect(page).to have_button("Submit")
    fill_in "hours", with: "40"

    click_button "Submit"

    expect(restaurant_1.threshold_records(40).first).to eq(employee)
    expect(restaurant_1.threshold_records(40).last).to eq(employee_2)
    expect(restaurant_1.threshold_records(40)).to_not include(employee_3)
  end
end
