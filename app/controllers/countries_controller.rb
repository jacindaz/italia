class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @regions = @country.regions
  end

  def all_cities
    @cities = City.all
    @country = Country.find(params[:id])

    render "cities/index"
  end

  private

  def find_city_id
    binding.pry
  end

  def all_cities_params
    params.require(:country).permit(:id).merge(region_id: "")
  end
end
