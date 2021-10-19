class Brewery < ApplicationRecord
  has_many :beers,
  dependent: :delete_all
end
