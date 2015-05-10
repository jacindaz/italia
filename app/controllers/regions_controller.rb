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
    @region = Region.new
  end

  def create
    @region = Region.new(strong_regions)

    if @region.save 
      redirect_to country_region_path(@region.country, @region)
    else
      render :'regions/new'
    end
  end

  private

  def strong_regions
    params.require(:region).permit(:english_name, :native_language_name, :description, :region_website, :country_id)
  end
end
