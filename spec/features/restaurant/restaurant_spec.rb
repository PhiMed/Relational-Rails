require 'rails_helper'

RSpec.describe "restaurant", type: :feature do
  it 'displays index' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant"

    expect(page).to have_content(restaurant.name)
    expect(page).to_not have_content("El Tapatio")
  end

  it 'displays restaurant attributes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurant/#{restaurant.id}"

    expect(page).to have_content(restaurant.seats)
  end

end
