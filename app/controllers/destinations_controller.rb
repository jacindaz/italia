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
  end

  def create
    # new destination + new address
    if params[:address][:street_address].present?
      @destination = Destination.new(destination_params)
      @address = Address.new(address_params)
      @destination.save
      @destination.address = @address
      @address.save
    # new destination + existing address    
    elsif params[:destination][:address] && !params[:address][:street_address]
      @destination = Destination.new(destination_params)
      @address = Address.find(params[:destination][:address])
      @destination.save
      @destination.address = @address
      @address.save
    # blank destination + blank address
    else
      @destination = Destination.new
      @address = Address.new
      @destination.save
      @address.save
    end
    
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

  private

  def destination_params
    params.require(:destination).permit(:english_name, :native_language_name,:category, :cost, :hours, :description, :destination_website, :image, address_attributes: [:street_address, :phone_number, :city_id, :zip, :id])
  end

end