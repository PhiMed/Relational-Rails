class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_desc
  end

  def new
  end

  def create
    @restaurant = Restaurant.create(restaurants_params)

    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
      restaurant = Restaurant.find(params[:id])
      restaurant.update(restaurants_params)
      restaurant.save

    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy

    redirect_to '/restaurants'
  end

  private
    def restaurants_params
      params.permit(:name, :seats, :serve_liquor)
      {
        name: params[:restaurant][:name],
        seats: params[:restaurant][:seats],
        serve_liquor: params[:restaurant][:serve_liquor]
        }
    end
end
