class BeerController < ApplicationController

  def index
    @beer = Beer.all
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

    redirect_to '/beer'
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
