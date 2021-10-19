require 'rails_helper'

RSpec.describe 'brewery beer index' do
  it 'displays beer information' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    beer_1 = Beer.create!(name: "Autumn Haze IPA",
                                vendor_lead_time: 7,
                                bottled: true,
                                brewery_id: brewery.id)

    visit "/brewery/#{brewery.id}/beer"

    expect(page).to have_content(beer_1.name)
    expect(page).to have_content(beer_1.vendor_lead_time)
  end
end
