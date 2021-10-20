require 'rails_helper'

RSpec.describe Beer, type: :model do
  it {should belong_to :brewery}

  it 'returns the associated beer object' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer_1 = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)
    beer_2 = Beer.create!(name: "Wild Weasel NA",
                                vendor_lead_time: 14,
                                bottled: true,
                                brewery_id: brewery.id)
    beer_3 = Beer.create!(name: "Samwise Adamas",
                                vendor_lead_time: 3,
                                bottled: false,
                                brewery_id: brewery.id)

    expect(beer_1.brewery).to eq(brewery)
  end

  it 'shows true beers' do
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

    expect(brewery.beers.true_beers).to eq([beer])
    expect(brewery.beers).to eq([beer, false_beer])
  end
end
