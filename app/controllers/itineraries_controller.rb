class ItinerariesController < ApplicationController

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(strong_itinerary)
    
    cities = params[:itinerary][:id]
    cities.reject! { |id| id.to_s.empty? }

    if @itinerary.save
      cities.each do |city|
        binding.pry
        ItineraryCity.create(city_id: city.to_i, itinerary: @itinerary)
      end
      flash[:notice] = "Itinerary saved!"
      redirect_to itineraries_path
    else 
      flash[:notice] = "Itinerary unable to be saved."
    end
  end

  private

  def strong_itinerary
    params.require(:itinerary).permit(:city_id, :name)
  end

end