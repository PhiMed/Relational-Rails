require 'rails_helper'

RSpec.describe "brewery", type: :feature do
  it 'displays index' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/brewery"

    expect(page).to have_content(brewery.name)
    expect(page).to_not have_content("Los 3 Amigos")
  end

  it 'displays brewery attributes' do
    brewery = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    visit "/brewery/#{brewery.id}"

    expect(page).to have_content(brewery.number_of_employees)
    expect(page).to_not have_content("true")
  end
end
