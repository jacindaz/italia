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

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to country_path(@country)
    else
      render :'countries/new'
    end
  end

  def update

  end

  def test_map_haml
  end

  def testing_map
  end

  private

  def country_params
    params.require(:country).permit(:english_name, :native_language_name, :description, :country_website)
  end

  def find_city_id
    binding.pry
  end

  def all_cities_params
    params.require(:country).permit(:id).merge(region_id: "")
  end
end
