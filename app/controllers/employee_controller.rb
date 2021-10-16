class EmployeeController < ApplicationController

  def index
    @employee = Employee.all.true_records
  end

  def new
  end

  def create
    employee = Employee.create!({
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

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update({
      name: params[:employee][:name],
      weekly_hours: params[:employee][:weekly_hours],
      over_21: params[:employee][:over_21],
      restaurant_id: params[:employee][:restaurant_id]
      })

    employee.save

    redirect_to "/employee/#{employee.id}"
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy

    redirect_to '/employee'
  end
end
