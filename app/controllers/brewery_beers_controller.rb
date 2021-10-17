class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:id])
    @beer = @brewery.beers
  end

  def new
    @brewery = Brewery.find(params[:id])
  end


  def create
      @brewery = Brewery.find(params[:id])
      @beer = Beer.create!({
        name: params[:beer][:name],
        vendor_lead_time: params[:beer][:vendor_lead_time],
        bottled: params[:beer][:bottled],
        created_at: params[:beer][:created_at],
        updated_at: params[:beer][:updated_at],
        brewery_id: @brewery.id
        })

      @beer.save

      redirect_to "/brewery/#{@brewery.id}/beer"

  end
end
