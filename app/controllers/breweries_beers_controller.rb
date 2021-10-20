class BreweriesBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:id])
    @beer = @brewery.beers

    if params[:sort_by] == "name"
      @beer = @brewery.beer_sort
    else
      @beer.all
    end

    if params[:threshold] != nil
      @beer = @brewery.threshold_records(params[:threshold])
    else
      @beer.all
    end
  end

  def new
    @brewery = Brewery.find(params[:id])
  end

  def create
      @brewery = Brewery.find(params[:id])
      @beer = Beer.create(breweries_beers_params)

      @beer.save

      redirect_to "/breweries/#{@brewery.id}/beers"
  end

  private
    def breweries_beers_params
      params.permit(:name, :vendor_lead_time, :bottled, :brewery_id)
      {
        name: params[:beer][:name],
        vendor_lead_time: params[:beer][:vendor_lead_time],
        bottled: params[:beer][:bottled],
        brewery_id: params[:beer][:brewery_id]
        }
    end

end
