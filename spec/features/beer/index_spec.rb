require 'rails_helper'

RSpec.describe "beer", type: :feature do
  it 'displays index' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    visit "/beer"

    expect(page).to have_content(beer.name)
    expect(page).to_not have_content("Pumpkin Spice Latte")
  end

  it 'displays beer attributes' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)


    visit "/beer/#{beer.id}"

    expect(page).to have_content(beer.id)
    expect(page).to have_content(beer.brewery_id)
    expect(page).to_not have_content("Pumpkin Spice Latte")
  end

  it 'provides links for beer and brewery indexes' do

    visit "/beer/new"

    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Brewery Index")
  end
end
