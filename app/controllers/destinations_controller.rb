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
    @destination = Destination.find(params[:id]) || nil
    @address = Address.find(params[:destination][:address]) || nil

    # updating destination only
    if params[:destination]
      if @address.nil?
        @destination.address = Address.find(params[:destination][:address].to_i)
      end
      @destination.update(destination_params)
    end

    # updating address or creating a new address
    if params[:address][:street_address].present?
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
      redirect_to destination_path(@destination)
    end
  end

  private

  # ??? not sure how to do nested attributes
  def destination_params
    params.require(:destination).permit(:english_name, :native_language_name,:category, :cost, :hours, :description, :destination_website, :image, address_attributes: [:street_address, :phone_number, :city_id, :zip, :destination_id])
  end

  def address_params
    params.require(:address).permit(:street_address, :phone_number, :city_id, :zip, :destination_id)
  end

end