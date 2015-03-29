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

  def save_destinations_and_address
    # new destination + existing address
    if params[:commit] == "Save destination"
      @destination = Destination.new(destination_params)
      @address = params[:destination][:address_id].present? ? Address.find(params[:destination][:address_id]) : Address.new
    # new destination + new address
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
    @address = Address.find(params[:destination][:address]) || nil

    # updating destination only
    if params[:destination]
      if @address.nil?
        @destination.address = Address.find(params[:destination][:address].to_i)
      end
      @destination.update(destination_params)
    end

    # updating address or creating a new address
    if params[:address]
      # address = Address.find_or_initialize_by(street_address: params[:address][:street_address], city_id: params[:address][:city_id])
      if params[:address][:street_address] == @address[:street_address] && params[:address][:city_id] == @address[:city_id] 
        # updating existing address
        @address.update(address_params)
      else
        # creating new address
        @address = Address.new(address_params)
        @address.destination_id = params[:id].to_i
        @address.save
      end
    end

    # if there are no errors, redirect
    if @destination.errors.any? || @address.errors.any?
      render :'destinations/edit'
    # if there are errors render
    else
      @destination.address = @address
      @destination.save
      redirect_to @destination
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