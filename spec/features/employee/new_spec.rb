require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'takes to new employee form' do
    visit "/employee/new"

    expect(current_path).to eq('/employee/new')
    expect(page).to have_content('Name')
    expecct(page).to have_link
  end

  it 'provides links for employee and restaurant indexes' do

    visit "/employee/new"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
