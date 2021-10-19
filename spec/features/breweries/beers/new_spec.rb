require 'rails_helper'

RSpec.describe " brewery beer new", type: :feature do
  it 'has a form to make a new beer' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/breweries/#{brewery.id}/beers"
    click_on "Create beer"

    expect(current_path).to eq("/breweries/#{brewery.id}/beers/new")
    expect(page).to have_content('Enter a new beer')
    expect(page).to have_link
  end

  it 'can create a new beer with the parent ID attached' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/breweries/#{brewery.id}/beers"
    click_on "Create beer"

    fill_in 'beer[name]', with: "Josephs Beer"
    fill_in 'beer[vendor_lead_time]', with: "7"
    fill_in 'beer[bottled]', with: "false"

    click_on "Create beer"

    expect(current_path).to eq("/breweries/#{brewery.id}/beers")
    expect(page).to have_content("Josephs Beer")
  end
end
