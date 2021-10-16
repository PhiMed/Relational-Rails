class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @employee = @restaurant.employee_sort
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @employee = Employee.create({
      name: params[:employee][:name],
      weekly_hours: params[:employee][:weekly_hours],
      over_21: params[:employee][:over_21],
      restaurant_id: params[:employee][:restaurant_id]
      })

    redirect_to "/restaurant/#{@restaurant.id}/employee"
  end
end
