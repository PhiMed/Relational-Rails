class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_desc
  end

  def new
  end

  def create
    @restaurants = Restaurant.create!({
      name: params[:restaurant][:name],
      seats: params[:restaurant][:seats],
      serve_liquor: params[:restaurant][:serve_liquor]
      })

    redirect_to '/restaurants'
  end

  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def edit
    @restaurants = Restaurant.find(params[:id])
  end

  def update
      restaurant = Restaurant.find(params[:id])
      restaurant.update({
        name: params[:restaurant][:name],
        seats: params[:restaurant][:seats],
        serve_liquor: params[:restaurant][:serve_liquor]
        })

      restaurant.save

    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy

    redirect_to '/restaurants'
  end
end
