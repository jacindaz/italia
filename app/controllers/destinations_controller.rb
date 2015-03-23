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

  def save_destinations_and_address
    if params[:commit] == "Save destination"
      @destination = Destination.new(destination_params)
      @address = params[:destination][:address_id].present? ? Address.find(params[:destination][:address_id]) : Address.new
    else
      @destination = Destination.new(destination_params)
      @address = Address.new(address_params)
    end
    
    if @address.save
      @destination.address_id = @address.id
      if @destination.save
        if !@destination.errors.messages.present? && !@address.errors.messages.present? 
          redirect_to destination_path(@destination)
        end
      else
        render :'destinations/new'
      end
    else
      @destination.save
      render :'destinations/new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @updated_address = Address.find(params[:destination][:address_id])

    if @updated_address == (@destination.address)
      if @destination.update(destination_params)
        redirect_to @destination
      end
    elsif @updated_address != (@destination.address)
      if @destination.update(destination_params) && @updated_address.update(address_params)
        redirect_to @destination
      end
    else
      render :'destinations/edit'
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
    params.require(:address).permit(:street_address, :phone_number, :city_id, :zip)
  end

end