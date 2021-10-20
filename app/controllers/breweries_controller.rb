class BreweriesController < ApplicationController

  def index
    @brewery = Brewery.order_desc
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

    redirect_to '/breweries'
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update({
      name: params[:brewery][:name],
      number_of_employees: params[:brewery][:number_of_employees],
      employee_owned: params[:brewery][:employee_owned]
      })

    @brewery.save

  redirect_to "/breweries/#{@brewery.id}"
  end

  def destroy
    brewery = Brewery.find(params[:id])
    brewery.destroy

    redirect_to '/breweries'
  end
end
