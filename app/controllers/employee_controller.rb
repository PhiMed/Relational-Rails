class EmployeeController < ApplicationController

  def index
    @employee = Employee.all
  end

  def new
  end

  def create
    employee = Employee.create({
      name: params[:employee][:name],
      weekly_hours: params[:employee][:weekly_hours],
      over_21: params[:employee][:over_21],
      restaurant_id: params[:employee][:restaurant_id]
      })

    redirect_to '/employee'
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
