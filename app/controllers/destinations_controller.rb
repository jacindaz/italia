class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @city = @destination.address.city
    @region = @city.region
    @country = @region.country
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to destination_path(@destination)
    else
      render :'destination/new'
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :category, :cost, :hours_open, :hours_close, :description, :destination_website, :address_id)
  end

end