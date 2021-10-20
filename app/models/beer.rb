class Beer < ApplicationRecord
  belongs_to :brewery

  def self.true_beers
    where(bottled: 'true')
  end
end
