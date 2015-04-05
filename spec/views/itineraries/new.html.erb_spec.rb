require 'rails_helper'

describe 'itineraries/new' do
  context 'when filling out the new itinerary form' do 
    it 'displays the form properly' do 
      itinerary = FactoryGirl.build(:itinerary)
      city1 = FactoryGirl.create(:city_with_region_country)
      city2 = FactoryGirl.create(:city_with_region_country)
      assign(:itinerary, itinerary)

      render 

      expect(rendered).to have_content city1.english_name
      expect(rendered).to have_content city2.english_name
      expect(rendered).to have_content "Itinerary Name"
    end
  end

end