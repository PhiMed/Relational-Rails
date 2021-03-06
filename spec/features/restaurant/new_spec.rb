require 'rails_helper'

RSpec.describe "restaurant", type: :feature do

  it 'takes to new restaurant form' do
    visit "/restaurants/new"

    expect(current_path).to eq('/restaurants/new')
    expect(page).to have_content('Name')
  end

  it 'provides links for employee and restaurant indexes' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants/new"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
