class EmployeesController < ApplicationController

  def index
    @employees = Employee.all.true_records
  end

  def show
    @employees = Employee.find(params[:id])
  end

  def edit
    @employees = Employee.find(params[:id])
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

    redirect_to "/employees/#{employee.id}"
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy

    redirect_to '/employees'
  end
end
