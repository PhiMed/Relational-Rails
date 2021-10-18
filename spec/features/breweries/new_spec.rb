require 'rails_helper'

RSpec.describe "brewery new", type: :feature do
  it 'has a form to make a new brewery' do

    visit "/breweries/new"

    expect(current_path).to eq("/breweries/new")
    expect(page).to have_content('Enter a new brewery:')
    expect(page).to have_link
  end

  it 'can create a new brewery' do

    visit "/breweries/new"

    fill_in 'brewery[name]', with: "Le Violon Dingue"
    fill_in 'brewery[number_of_employees]', with: "20"
    fill_in 'brewery[employee_owned]', with: "false"

    click_on "submit"

    expect(current_path).to eq("/breweries")
    expect(page).to have_content("Le Violon Dingue")
  end
end
