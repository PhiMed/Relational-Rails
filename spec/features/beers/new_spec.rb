require 'rails_helper'

RSpec.describe "beer new", type: :feature do
  it 'has a new beer form' do
    visit "/beers/new"

    expect(current_path).to eq('/beers/new')
    expect(page).to have_content('Name')
    expect(page).to have_link
  end

  it 'can create a new beer' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/beers/new"

    fill_in "beer[name]", with: "RC Beer"
    fill_in "beer[vendor_lead_time]", with: "5"
    fill_in "beer[bottled]", with: "true"
    fill_in "beer[brewery_id]", with: brewery.id

    click_on "submit"

    expect(page).to have_content("RC Beer")
  end


  it 'provides links for beer and brewery indexes' do

    visit "/beers/new"

    expect(page).to have_link("Beers Index")
    expect(page).to have_link("Breweries Index")
  end
end
