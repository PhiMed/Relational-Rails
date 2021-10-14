require 'rails_helper'

RSpec.describe "restaurant", type: :feature do

  it 'takes to new restaurant form' do
    visit "/restaurant/new"

    expect(current_path).to eq('/restaurant/new')
    expect(page).to have_content('Name')
  end
end  
