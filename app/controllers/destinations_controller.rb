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
    if !params[:destination][:address_id]
      @destination = Destination.new(destination_params)
      @address = Address.new(address_params)
      @destination.address = @address
      @address.save
    else
      @destination = Destination.new(destination_params(true))
    end

    if @destination.save
      redirect_to destination_path(@destination)
    else
      render :'destinations/new'
    end
  end

  private

  def destination_params(has_address = false)
    if has_address
      params.require(:destination).permit(:name, :category, :cost, :hours, :description, :destination_website, :address_id)
    else
      params.require(:destination).permit(:name, :category, :cost, :hours, :description, :destination_website)
    end
  end

  def address_params
    params.require(:address).permit(:address, :phone_number, :city_id, :zip)
  end

end