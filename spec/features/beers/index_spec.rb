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

    visit "/beers"

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


    visit "/beers/#{beer.id}"

    expect(page).to have_content(beer.id)
    expect(page).to have_content(beer.brewery_id)
    expect(page).to_not have_content("Pumpkin Spice Latte")
  end

  it 'provides links for beer and brewery indexes' do

    visit "/beers/new"

    expect(page).to have_link("Beers Index")
    expect(page).to have_link("Breweries Index")
  end

  it 'only shows true records' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)
    beer = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)
    false_beer = Beer.create!(name: "some not-bottled beer",
                                vendor_lead_time: 7,
                                bottled: false,
                                brewery_id: brewery.id)
    visit "/beers"

    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(false_beer.name)
  end
end
