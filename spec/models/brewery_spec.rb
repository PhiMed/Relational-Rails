require 'rails_helper'

RSpec.describe Brewery, type: :model do
  it {should have_many :beers}

  it 'orders its breweries by created_at' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)
    brewery_2 = Brewery.create!(name: "Crazy Vaclavs",
                                    number_of_employees: 4,
                                    employee_owned: true)

    expect(Brewery.order_desc.first).to eq(brewery_2)
    expect(Brewery.order_desc.first).not_to eq(brewery)
  end

  it 'can sort a brewerys beers alphabetically' do
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

    expect(brewery.beer_sort.first).to eq(beer_2)
    expect(brewery.beer_sort.last).to eq(beer_1)
  end


  it 'can return records over a certain threshold' do
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


    expect(brewery.threshold_records(8)).to eq([beer_2])
  end

end
