require 'rails_helper'

RSpec.describe "restaurant", type: :feature do

  it 'displays restaurant attributes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "El Tapatio",
                                      seats: 400,
                                      serve_liquor: true)

    visit "/restaurant/#{restaurant.id}"

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant.seats)
    expect(page).to have_content(restaurant.serve_liquor)
    expect(page).to_not have_content(restaurant_2.name)
    expect(page).to_not have_content(restaurant_2.seats)
    expect(page).to_not have_content(restaurant_2.serve_liquor)
  end
end
