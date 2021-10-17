require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should have_many :employees}

  it 'is sorted by created_at date and shows that date' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)
    restaurant_2 = Restaurant.create!(name: "Del Taco",
                                      seats:25,
                                      serve_liquor: false)

    expect(Restaurant.order_desc.first).to eq(restaurant_2)
    expect(Restaurant.order_desc.first).to_not eq(restaurant_1)
  end

  it 'sorts restaurant employees by name alphabetically' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant_1.id)
    employee_2 = Employee.create!(name: "Latoya Jones",
                                weekly_hours: 45,
                                over_21: false,
                                restaurant_id: restaurant_1.id)

    expect(restaurant_1.employees.first).to eq(employee)
    expect(restaurant_1.employees.first).to_not eq(employee_2)
  end

  it 'finds and displays records over a threshold' do
    restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                    seats: 12,
                                    serve_liquor: false)

    employee = Employee.create!(name: "Bob Smith",
                                weekly_hours: 40,
                                over_21: true,
                                restaurant_id: restaurant_1.id)
    employee_2 = Employee.create!(name: "Latoya Jones",
                                weekly_hours: 45,
                                over_21: false,
                                restaurant_id: restaurant_1.id)
    employee_3 = Employee.create!(name: "Ricky Gonzales",
                                weekly_hours: 39,
                                over_21: true,
                                restaurant_id: restaurant_1.id)

    expect(restaurant_1.threshold_records.first).to eq(employee)
    expect(restaurant_1.threshold_records.last).to eq(employee_2)
    expect(restaurant_1.threshold_records).to_not include(employee_3)
  end
end
