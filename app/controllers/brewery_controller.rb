class BreweryController < ApplicationController

  def index
    @brewery = Brewery.all
  end

  def new
  end

  def create
    brewery = Brewery.new({
      name: params[:brewery][:name],
      number_of_employees: params[:brewery][:number_of_employees],
      employee_owned: params[:brewery][:employee_owned],
      created_at: params[:brewery][:created_at],
      updated_at: params[:brewery][:updated_at]
      })

    brewery.save

    redirect_to '/brewery'
  end

  def show
    @brewery = Brewery.find(params[:id])
  end
end
