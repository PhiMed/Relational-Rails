class Restaurant < ApplicationRecord
  has_many :employees

  def self.order_desc
    order('created_at desc')
  end
end
