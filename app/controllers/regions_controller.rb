class RegionsController < ApplicationController

  def index
    @country = Country.find(params[:country_id])
    @regions = Region.all
  end

  def show
    @country = Country.find(params[:country_id])
    @region = Region.find(params[:id])
    @cities = @region.cities
  end

  def new
    @country = Country.find(params[:country_id])
    @region = Region.new
  end

  def create
    @region = Region.new(strong_regions)
    @country = Country.find(params[:country_id])
    @region.country = @country

    if @region.save 
      redirect_to country_region_path(@country, @region)
    else
      render :'regions/new'
    end
  end

  private

  def strong_regions
    params.require(:region).permit(:english_name, :native_language_name, :description, :region_website)
  end
end
