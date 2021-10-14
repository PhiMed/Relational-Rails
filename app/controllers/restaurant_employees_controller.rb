class RestaurantEmployeesController < ApplicationController
  def index
    restaurant = Restaurant.find(params[:id])
    @employee = restaurant.employees
  end
end
