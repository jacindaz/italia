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
    binding.pry
    @destination = Destination.find(params[:id])

    # updating destination only
    if params[:destination] && params[:destination][:address_id]
      redirect_to @destination if @destination.update(destination_params)
    # updating address or creating a new address
    elsif params[:address] && params[:destination].nil?
      # updating address
      if 
        old_address = Address.where(street_address: params[:address][:street_address])
        @updated_address = old_address(address_params)
        if @updated_address.update
          redirect_to @destination
        end
      # creating new address
      else
      end
    # updating destination and address
    elsif !params[:destination][:address_id] && params[:destination] && params[:address]
      if @destination.update(destination_params)
        if @updated_address.update(address_params)
          redirect_to @destination
        end
      end
    # not updating anything, submits the same data
    else
      render :'destinations/edit'
    end

    # catch-all if any errors result from updating in the above if statements
    if @destination.errors.messages.present? || @updated_address.errors.messages.present? 
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