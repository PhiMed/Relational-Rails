require 'rails_helper'

RSpec.describe "beer", type: :feature do
  it 'creates a new beer' do
    visit "/beer/new"
    fill_in "beer[name]", with: "Los Gatos"
    sleep 1

    fill_in "beer[vendor_lead_time]", with: "40"
    fill_in "beer[bottled]", with: "false"
    fill_in "beer[brewery_id]", with: "1"
    click_on "Submit"

    expect(page).to have_content("Los Gatos")
    expect(page).to have_content("40")
    expect(page).to have_content("false")
    expect(page).to_not have_content("Johnny Walker Blue Label")
  end
end
