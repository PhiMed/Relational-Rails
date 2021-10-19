class Restaurant < ApplicationRecord
  has_many :employees, :dependent => :destroy

  def self.order_desc
    order('created_at desc')
  end

  def employee_sort
    employees.order('name')
  end

  def threshold_records(num)
    employees.where("weekly_hours >= ?", num)
  end
end
