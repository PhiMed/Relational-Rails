class EmployeeController < ApplicationController

  def index
    @employee = Employee.all
  end

  def new
  end

  def create
    employee = Employee.new({
      name: params[:employee][:name],
      weekly_hours: params[:employee][:weekly_hours],
      over_21: params[:employee][:over_21],
      created_at: params[:employee][:created_at],
      updated_at: params[:employee][:updated_at],
      restaurant_id: params[:employee][:restaurant_id]
      })

    employee.save

    redirect_to '/employee'
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
