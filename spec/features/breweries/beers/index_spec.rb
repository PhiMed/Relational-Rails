require 'rails_helper'

RSpec.describe 'brewery beer index' do
  it 'displays brewery beer information' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer_1 = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_content(beer_1.name)
    expect(page).to have_content(beer_1.vendor_lead_time)
  end

  it 'can sort the beers alphabetically' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer_1 = Beer.create!(name: "Zandman Pale Ale",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    beer_2 = Beer.create!(name: "Autumn Haze IPA",
                              vendor_lead_time: 7,
                              bottled: true,
                              brewery_id: brewery.id)


    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_link("Sort Beers Alphabetically")

    click_on "Sort Beers Alphabetically"

    expect(brewery.beer_sort.first).to eq(beer_2)
    expect(brewery.beer_sort.last).to eq(beer_1)
  end

  it 'can return records with more than x things' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer_1 = Beer.create!(name: "Zandman Pale Ale",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    beer_2 = Beer.create!(name: "Autumn Haze IPA",
                              vendor_lead_time: 10,
                              bottled: true,
                              brewery_id: brewery.id)


    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_content("Only return records with more than")

    fill_in 'threshold', with: "8"
    click_on "Submit"


    expect(page).to have_content("Autumn Haze IPA")
    expect(page).not_to have_content("Zandman Pale Ale")
  end
end
