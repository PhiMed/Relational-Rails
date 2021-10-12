class RestaurantController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

  def new
  end

  def create
    restaurant = Restaurant.new({
      name: params[:restaurant][:name],
      created_at: params[:restaurant][:created_at],
      updated_at: params[:restaurant][:updated_at],
      seats: params[:restaurant][:seats],
      serve_liquor: params[:restaurant][:serve_liquor]
      })

    restaurant.save

    redirect_to '/restaurant'
  end
end
