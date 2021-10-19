require 'rails_helper'

RSpec.describe "beer show", type: :feature do
  it 'displays beer attributes' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)


    visit "/beers/#{beer.id}"

    expect(page).to have_content(beer.name)
    expect(page).to have_content(beer.bottled)
  end

  it 'provides links for beer and brewery indexes' do

    visit "/beers/new"

    expect(page).to have_link("Beers Index")
    expect(page).to have_link("Breweries Index")
  end
end
