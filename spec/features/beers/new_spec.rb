require 'rails_helper'

RSpec.describe "beer new", type: :feature do
  it 'has a new beer form' do
    visit "/beers/new"

    expect(current_path).to eq('/beers/new')
    expect(page).to have_content('Name')
    expect(page).to have_link
  end

  it 'provides links for beer and brewery indexes' do

    visit "/beers/new"

    expect(page).to have_link("Beers Index")
    expect(page).to have_link("Breweries Index")
  end
end
