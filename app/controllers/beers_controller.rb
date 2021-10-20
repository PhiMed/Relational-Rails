class BeersController < ApplicationController

  def index
    @beer = Beer.all.true_beers
  end

  def new
  end

  def create
    beer = Beer.new({
      name: params[:beer][:name],
      vendor_lead_time: params[:beer][:vendor_lead_time],
      bottled: params[:beer][:bottled],
      created_at: params[:beer][:created_at],
      updated_at: params[:beer][:updated_at],
      brewery_id: params[:beer][:brewery_id]
      })

    beer.save

    redirect_to '/beers'
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    beer = Beer.find(params[:id])
    beer.update(beers_params)

    beer.save

  redirect_to "/beers/#{beer.id}"
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy

    redirect_to '/beers'
  end

private
  def beers_params
    params.permit(:name, :vendor_lead_time, :bottled, :brewery_id)
    {
      name: params[:beer][:name],
      vendor_lead_time: params[:beer][:vendor_lead_time],
      bottled: params[:beer][:bottled],
      brewery_id: params[:beer][:brewery_id]
      }
  end
end
