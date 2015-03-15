require 'rails_helper'

feature 'saving a new itinerary' do

  context "with appropriate factories" do
    let(:city) { FactoryGirl.create(:city_with_region_country) }
    let(:itinerary) { FactoryGirl.build(:itinerary) }

    scenario 'user creates a new itinerary with a few cities' do 
      city1 = FactoryGirl.create(:city_with_region_country)
      city2 = FactoryGirl.create(:city_with_region_country)

      visit new_itinerary_path(itinerary)

      fill_in "itinerary_name", with: itinerary.name
      check "#{city1.english_name}"
      check "#{city2.english_name}"
      click_on "Save"

      itinerary = Itinerary.last
      expect(current_path).to eq itineraries_path

      expect(page).to have_content itinerary.name
      expect(page).to have_content "About #{city1.native_language_name}"
      expect(page).to have_content "About #{city2.native_language_name}"
    end
  end

end