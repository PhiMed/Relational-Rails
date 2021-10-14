require 'rails_helper'

RSpec.describe "brewery", type: :feature do
  it 'displays beer count' do
    brewery_1 = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)
    beer_2 = Beer.create!(name: "Not Coors",
                                vendor_lead_time: 10,
                                bottled: false,
                                brewery_id: brewery_1.id)

    visit "/brewery/#{brewery_1.id}"

    expect(page).to have_content("Beer count")
    expect(page).to have_content(brewery_1.beers.count)
  end
end
