require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should have_many :employees}

  it 'is sorted by created_at date' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "Del Taco",
                                      seats:25,
                                      serve_liquor: false)

    expect(Restaurant.all.order_desc.first).to eq(restaurant_2)
    expect(Restaurant.all.order_desc.first).to_not eq(restaurant_1)
  end  
end
