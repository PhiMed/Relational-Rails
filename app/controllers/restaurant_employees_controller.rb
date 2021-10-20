class RestaurantEmployeesController < ApplicationController
  def index
    @restaurants = Restaurant.find(params[:id])
    @employees = @restaurants.employees

    if params[:sort_by] == "name"
      @employees = @restaurants.employee_sort
    else
      @employees.all
    end

    if params[:hours]
      @employees = @restaurants.threshold_records(params[:hours])
    else
      @employees.all
    end
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @employees = Employee.create(restaurant_employees_params)

    redirect_to "/restaurants/#{@restaurant.id}/employees"
  end

  def destroy
    @restaurants = Restaurant.find(params[:id])
    @employees = @restaurants.employees

    single_emp = @employees.find do |employee|
      employee.id
    end

    single_emp.destroy

    redirect_to "/restaurants/#{@restaurants.id}/employees"
  end

  private
    def restaurant_employees_params
      params.permit(:name, :weekly_hours, :over_21, :restaurant_id)
      {
        name: params[:employee][:name],
        weekly_hours: params[:employee][:weekly_hours],
        over_21: params[:employee][:over_21],
        restaurant_id: params[:employee][:restaurant_id]
        }
    end
end
