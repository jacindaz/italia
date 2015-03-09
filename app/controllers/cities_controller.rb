class CitiesController < ApplicationController

  def index
    @country = Country.find(params[:country_id]) || Country.find(params[:city][:country_id])
    @regions = Region.all
  end

  def show
    @city = City.find(params[:id])
    @country = Country.find(params[:country_id])
    @region = @city.region
  end

  def new
    @country = Country.find(params[:country_id]) || Country.find(params[:city][:country_id])
    @city = City.new
    @region = @city.region
  end

  def create
    @country = Country.find(params[:country_id])
    @city = City.new(strong_cities)
    current_region = Region.find(params[:city][:region_id])
    @city.region = current_region

    if @city.save 
      redirect_to country_city_path(@country, @city)
    else
      render :'cities/new'
    end
  end

  private

  def strong_cities
    params.require(:city).permit(:english_name, :native_language_name, :description, :city_website, :is_capital)
  end

end