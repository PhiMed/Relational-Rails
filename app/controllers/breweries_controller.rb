class BreweriesController < ApplicationController

  def index
    @brewery = Brewery.order_desc
  end

  def new
  end

  def create
    brewery = Brewery.new(breweries_params)

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
    @brewery.update(breweries_params)

    @brewery.save

  redirect_to "/breweries/#{@brewery.id}"
  end

  def destroy
    brewery = Brewery.find(params[:id])
    brewery.destroy

    redirect_to '/breweries'
  end

  private
    def breweries_params
      params.permit(:name, :number_of_employees, :serve_liquor)
      {
        name: params[:brewery][:name],
        number_of_employees: params[:brewery][:number_of_employees],
        employee_owned: params[:brewery][:employee_owned]
        }
    end
end
