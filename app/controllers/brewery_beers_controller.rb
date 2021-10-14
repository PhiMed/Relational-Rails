class BreweryBeersController < ApplicationController
  def index
    brewery = Brewery.find(params[:id])
    @beer = brewery.beers
  end
end
