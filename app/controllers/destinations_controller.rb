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

  def edit
    @destination = Destination.find(params[:id])
    @address = @destination.address
  end

  def create
    if !params[:destination][:address_id]
      @destination = Destination.new(destination_params)
      @address = Address.new(address_params)
      @destination.address = @address
      @address.save
    else
      @destination = Destination.new(destination_params)
    end

    if @destination.save
      redirect_to destination_path(@destination)
    else
      @address = Address.new
      render :'destinations/new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    updated_address = Address.find(params[:destination][:address_id])

    if updated_address == (@destination.address)
      if @destination.update(destination_params)
        redirect_to @destination
      end
    elsif updated_address != (@destination.address)
      if @destination.update(destination_params) && updated_address.update(address_params)
        redirect_to @destination
      end
    else
      render 'edit'
    end
  end

  private

  def destination_params(has_address = true)
    if has_address
      params.require(:destination).permit(:english_name, :native_language_name,:category, :cost, :hours, :description, :destination_website, :address_id, :image)
    else
      params.require(:destination).permit(:name, :category, :cost, :hours, :description, :destination_website, :image)
    end
  end

  def address_params
    params.require(:address).permit(:address, :phone_number, :city_id, :zip)
  end

end