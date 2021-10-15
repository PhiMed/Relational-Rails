require 'rails_helper'

RSpec.describe "restaurant", type: :feature do
  it 'displays index' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "El Tapatio",
                                      seats: 400,
                                      serve_liquor: true)

    visit "/restaurant"

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant_2.name)
    expect(page).to_not have_content("Del Taco")
  end

  it 'is sorted by created_at date' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "Del Taco",
                                      seats:25,
                                      serve_liquor: false)

    expect(Restaurant.all.reverse_order.first).to eq(restaurant_2)
    expect(Restaurant.all.reverse_order.first).to_not eq(restaurant_1)
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
