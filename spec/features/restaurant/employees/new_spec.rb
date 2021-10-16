require 'rails_helper'

RSpec.describe "restaurant employee", type: :feature do
  it 'takes to new restaurant employee form' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    employee = restaurant.employees.create(name: "Bob Smith",
                                            weekly_hours: 40,
                                            over_21: true,
                                            restaurant_id: restaurant.id)


    visit "/restaurant/#{restaurant.id}/employee/new"

    expect(current_path).to eq("/restaurant/#{restaurant.id}/employee/new")
    expect(page).to have_content('Name:')
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant/#{restaurant.id}/employee/new"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
