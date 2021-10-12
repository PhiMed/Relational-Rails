class RestaurantController < ApplicationController

  def index
    @restaurant = ["Arvada Tavern", "Chez Gustaf", "Los Gatos"]
  end
end
