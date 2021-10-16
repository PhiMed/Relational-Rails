require 'rails_helper'

RSpec.describe "beer", type: :feature do
  it 'has a new beer form' do
    visit "/beer/new"

    expect(current_path).to eq('/beer/new')
    expect(page).to have_content('Name')
    expect(page).to have_link
  end

  it 'provides links for beer and brewery indexes' do

    visit "/beer/new"

    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Brewery Index")
  end
end
