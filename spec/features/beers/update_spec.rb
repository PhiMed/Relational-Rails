require 'rails_helper'

RSpec.describe "beer update", type: :feature do
  it 'can update a beers information' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)
    beer = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    visit "/beers/#{beer.id}/edit"

    fill_in "beer[name]", with: "RC Beer"
    fill_in "beer[vendor_lead_time]", with: "5"
    fill_in "beer[bottled]", with: "true"
    fill_in "beer[brewery_id]", with: "#{brewery.id}"

    click_on "Update Beer"

    expect(page).to have_content("RC Beer")
    expect(current_path).to eq("/beers/#{beer.id}")
    expect(page).to_not have_content("Autumn Haze IPA")

  end
end
