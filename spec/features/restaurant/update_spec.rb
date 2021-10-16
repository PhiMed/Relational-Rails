require 'rails_helper'

RSpec.describe "restaurant", type: :feature do
  it 'edits a restaurant' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
                                    
    visit "/restaurant/#{restaurant.id}/edit"
    fill_in "restaurant[name]", with: "Taco Bell"
    fill_in "restaurant[seats]", with: "12"
    fill_in "restaurant[serve_liquor]", with: "false"
    click_on "Update Restaurant"

    expect(page).to have_content("Taco Bell")
    expect(current_path).to eq("/restaurant/#{restaurant.id}")
    expect(page).to_not have_content("Mary Takanaka")
  end
end
