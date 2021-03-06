require 'rails_helper'

RSpec.describe "brewery index", type: :feature do
  it 'displays index' do
    brewery_1 = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    brewery_2 = Brewery.create!(name: "Chez Paul",
                                    number_of_employees: 10,
                                    employee_owned: true)


    visit "/breweries"

    expect(page).to have_content(brewery_1.name)
    expect(page).to have_content(brewery_2.name)
    expect(page).to_not have_content("O'Malleys")
  end

  it 'is sorted by created_at date' do
    brewery_1 = Brewery.create!(name: "Breckenridge Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)

    brewery_2 = Brewery.create!(name: "Chez Paul",
                                    number_of_employees: 10,
                                    employee_owned: true)

    expect(Brewery.all.reverse_order.first).to eq(brewery_2)
    expect(Brewery.all.reverse_order.first).to_not eq(brewery_1)
  end

  it 'can delete a brewery' do
    deletable_brewery = Brewery.create!(name: "Deleteable Brewery",
                                    number_of_employees: 120,
                                    employee_owned: false)
    visit "/breweries"

    expect(page).to have_content(deletable_brewery.name)

    click_on "Delete Brewery"

    expect(page).not_to have_content(deletable_brewery.name)
  end
end
