class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @region = Region.find(params[:region_id])
    @city = City.find(params[:id])
    @country = @city.region.country
  end

end