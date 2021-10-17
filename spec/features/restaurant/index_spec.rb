require 'rails_helper'

RSpec.describe "restaurant", type: :feature do
  it 'displays index' do
    restaurant = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "El Tapatio",
                                      seats: 400,
                                      serve_liquor: true)

    visit "/restaurants"

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant_2.name)
    expect(page).to_not have_content("Del Taco")

    click_link "#{restaurant.name}"
    expect(current_path).to eq("/restaurants/#{restaurant.id}")
  end

  it 'has link to add new restaurant' do
    visit "/restaurants"

    click_link "New Restaurant"
    expect(current_path).to eq('/restaurants/new')
  end

  it 'is sorted by created_at date and shows that date' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "Del Taco",
                                      seats:25,
                                      serve_liquor: false)

    visit "/restaurants"

    expect(Restaurant.all.order_desc.first).to eq(restaurant_2)
    expect(Restaurant.all.order_desc.first).to_not eq(restaurant_1)
    expect(page).to have_content(restaurant_1.created_at)
    expect(page).to have_content(restaurant_2.created_at)
  end

  it 'provides links for employee, restaurant, welcome indexes' do
    visit "/restaurants"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
    expect(page).to have_link("Welcome Index")
  end

  it 'provides update link for each restaurant' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants"
    expect(page).to have_link("Update Restaurant")

    click_link "Update Restaurant"
    expect(current_path).to eq("/restaurants/#{restaurant_1.id}/edit")

    fill_in "restaurant[name]", with: "Del Taco"
    fill_in "restaurant[seats]", with: "15"
    fill_in "restaurant[serve_liquor]", with: "true"
    click_button "Update Restaurant"

    expect(current_path).to eq("/restaurants/#{restaurant_1.id}")
  end

  it 'provides delete link for each restaurant' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    visit "/restaurants"
    expect(page).to have_button("Delete Restaurant")

    click_button "Delete Restaurant"
    expect(current_path).to eq("/restaurants")

    expect(page).to_not have_content("Taco Bell")
  end
end
