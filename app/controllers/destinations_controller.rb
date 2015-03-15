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
    @address = Address.new
  end

  def create
    @destination = Destination.new(destination_params)
    @address = Address.new(address_params)
    @destination.address = @address

    if @destination.save && @address.save
      redirect_to destination_path(@destination)
    else
      render :'destinations/new'
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :category, :cost, :hours, :description, :destination_website)
  end

  def address_params
    params.require(:address).permit(:address, :phone_number, :city_id, :zip)
  end

end