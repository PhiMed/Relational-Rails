require 'rails_helper'

RSpec.describe "employee", type: :feature do
  it 'takes to new employee form' do
    visit "/employee/new"

    expect(current_path).to eq('/employee/new')
    expect(page).to have_content('Name')
  end
end
