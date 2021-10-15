class RestaurantController < ApplicationController

  def index
    @restaurant = Restaurant.all.order_desc
  end

  def new
  end

  def create
    restaurant = Restaurant.create!({
      name: params[:restaurant][:name],
      seats: params[:restaurant][:seats],
      serve_liquor: params[:restaurant][:serve_liquor]
      })

    redirect_to '/restaurant'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
      restaurant = Restaurant.find(params[:id])
      restaurant.update({
        name: params[:restaurant][:name],
        seats: params[:restaurant][:seats],
        serve_liquor: params[:restaurant][:serve_liquor]
        })

      restaurant.save

    redirect_to "/restaurant/#{restaurant.id}"
  end
end
