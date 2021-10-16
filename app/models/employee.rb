class Employee < ApplicationRecord
  belongs_to :restaurant

  def self.true_records
    where(over_21: "true")
  end
end
