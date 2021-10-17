require 'rails_helper'

RSpec.describe "restaurant", type: :feature do

  it 'takes to an edit restaurant form' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    visit "/restaurants/#{restaurant.id}/edit"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
    expect(page).to have_content('Name')
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants/#{restaurant.id}/edit"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
