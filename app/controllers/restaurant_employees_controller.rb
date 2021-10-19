class RestaurantEmployeesController < ApplicationController
  def index
    @restaurants = Restaurant.find(params[:id])
    @employees = @restaurants.employees

    if params[:sort_by] == "name"
      @employees = @restaurants.employee_sort
    else
      @employees.all
    end

    if params[:hours] == "hours"
      @employees = @restaurants.threshold_records(params[:hours])
    else
      @employees.all
    end
  end

  def new
    @restaurants = Restaurant.find(params[:id])
  end

  def create
    @restaurants = Restaurant.find(params[:id])
    @employees = Employee.create({
      name: params[:employee][:name],
      weekly_hours: params[:employee][:weekly_hours],
      over_21: params[:employee][:over_21],
      restaurant_id: params[:employee][:restaurant_id]
      })

    redirect_to "/restaurants/#{@restaurants.id}/employees"
  end

  def destroy
    @restaurants = Restaurant.find(params[:id])
    @employees = @restaurants.employees

    @employees.destroy

    redirect_to "/restaurants/#{@restaurants.id}/employees"
  end
end
