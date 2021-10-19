require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'takes to new employee form' do
    visit "/employees/new"

    expect(current_path).to eq('/employees/new')
    expect(page).to have_content('Name')
  end

  it 'provides links for employee and restaurant indexes' do

    visit "/employees/new"

    expect(page).to have_link("Employee Index")
    expect(page).to have_link("Restaurant Index")
  end
end
