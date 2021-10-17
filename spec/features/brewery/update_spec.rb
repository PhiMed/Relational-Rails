require 'rails_helper'

RSpec.describe "brewery update", type: :feature do
  it 'can update a brewery information' do
    brewery_1 = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/brewery/#{brewery_1.id}/edit"

    fill_in "brewery[name]", with: "The Big Bunny Brewery"
    fill_in "brewery[number_of_employees]", with: "5"
    fill_in "brewery[employee_owned]", with: "true"

    click_on "Update Brewery"

    expect(page).to have_content("The Big Bunny Brewery")
    expect(current_path).to eq("/brewery/#{brewery_1.id}")
    expect(page).to_not have_content("Breckenridge Brewery")

  end
end
