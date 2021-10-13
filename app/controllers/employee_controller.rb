class EmployeeController < ApplicationController

  def index
    @employee = Employee.all
  end
end
