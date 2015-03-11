class DestinationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :category, :cost, :hours_open, :hours_close, :description, :destination_website, :address_id)
  end

end