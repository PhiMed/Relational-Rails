require 'rails_helper'

RSpec.describe "restaurant", type: :feature do

  it 'displays restaurant attributes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "El Tapatio",
                                      seats: 400,
                                      serve_liquor: true)

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant.seats)
    expect(page).to have_content(restaurant.serve_liquor)
    expect(page).to_not have_content(restaurant_2.name)
    expect(page).to_not have_content(restaurant_2.seats)
    expect(page).to_not have_content(restaurant_2.serve_liquor)
  end

  it 'shows number of employees' do
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

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_content(restaurant.employees.count)
    expect(restaurant.employees.count).to eq(2)
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end

  it 'deletes a restaurant instance and its employees' do
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

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_button("Delete Restaurant")
    expect(restaurant.employees.count).to eq(2)

    click_button "Delete Restaurant"

    expect(current_path).to eq('/restaurants')
    expect(page).to_not have_content("Taco Bell")
  end
end
