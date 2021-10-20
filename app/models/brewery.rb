class Brewery < ApplicationRecord
  has_many :beers,
  dependent: :delete_all

  def self.order_desc
    order('created_at desc')
  end

  def beer_sort
    beers.order('name')
  end

  def threshold_records(days)
    beers.where("vendor_lead_time >= ?", days)
  end

end
