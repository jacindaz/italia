require 'rails_helper'

describe 'itineraries/index' do
  context 'when the itinerary object has a name' do 
    it 'displays the name' do 
      itinerary1 = FactoryGirl.create(:itinerary_with_city)
      itinerary2 = FactoryGirl.create(:itinerary_with_city)
      assign(:itineraries, [itinerary1, itinerary2])

      render 

      expect(rendered).to have_content itinerary1.name
      expect(rendered).to have_content itinerary2.name
    end
  end

end