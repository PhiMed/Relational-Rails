class RestaurantController < ApplicationController

  def index
    @restaurant = Restaurant.all.order(params[:created_at]).reverse
  end

  def new
  end

  def create
    restaurant = Restaurant.new({
      name: params[:restaurant][:name],
      seats: params[:restaurant][:seats],
      serve_liquor: params[:restaurant][:serve_liquor],
      created_at: params[:restaurant][:created_at],
      updated_at: params[:restaurant][:updated_at]
      })

    restaurant.save

    redirect_to '/restaurant'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
