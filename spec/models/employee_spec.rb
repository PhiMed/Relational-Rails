require 'rails_helper'

RSpec.describe Employee, type: :model do
  it {should belong_to :restaurant}

  describe '#employee' do
    it 'returns the associated restaurant object' do
      restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                  seats: 12,
                                  serve_liquor: false)
      restaurant_2 = Restaurant.create!(name: "Sergio's",
                                  seats: 40,
                                  serve_liquor: true)

      employee_1 = Employee.create!(name: "Bob Smith",
                                  weekly_hours: 40,
                                  over_21: true,
                                  restaurant_id: restaurant_1.id)
      employee_2 = Employee.create!(name: "Svetlana Boyko",
                                  weekly_hours: 24,
                                  over_21: true,
                                  restaurant_id: restaurant_2.id)
      expect(employee_1.restaurant).to eq(restaurant_1)
      expect(employee_2.restaurant).not_to eq(restaurant_1)
      expect(employee_2.restaurant).to eq(restaurant_2)
    end

    it 'shows true records' do
      restaurant_1 = Restaurant.create!(name: "Taco Bell",
                                  seats: 12,
                                  serve_liquor: false)
      restaurant_2 = Restaurant.create!(name: "Sergio's",
                                  seats: 40,
                                  serve_liquor: true)

      employee_1 = Employee.create!(name: "Bob Smith",
                                  weekly_hours: 40,
                                  over_21: true,
                                  restaurant_id: restaurant_1.id)
      employee_2 = Employee.create!(name: "Svetlana Boyko",
                                  weekly_hours: 24,
                                  over_21: false,
                                  restaurant_id: restaurant_2.id)
      employee_3 = Employee.create!(name: "Mariko Tanaka",
                                  weekly_hours: 38,
                                  over_21: true,
                                  restaurant_id: restaurant_2.id)

      expect(Employee.true_records).to include(employee_1)
      expect(Employee.true_records).to include(employee_3)
      expect(Employee.true_records).to_not include(employee_2)
    end
  end
end
