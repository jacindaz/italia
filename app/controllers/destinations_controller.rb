class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    @cities = City.all
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

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(destination_params)
    @address = Address.new(address_params) if params[:address]
    @address.save
    @destination.address = @address
    @destination.save

    if !@destination.errors.messages.present? && !@address.errors.messages.present? 
      redirect_to destination_path(@destination)
    else
      render :'destinations/new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to destination_path(@destination)
    else
      render :'destinations/edit'
    end
  end

  def destroy 
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:english_name, :native_language_name,:category, :cost, :hours, :description, :destination_website, :image, :address_id, address_attributes: [:street_address, :phone_number, :city_id, :zip, :id])
  end

  def address_params
    params.require(:address).permit(:street_address, :phone_number, :city_id, :zip)
  end

end