require 'rails_helper'

describe 'cities/index' do
  context 'when the city object has a native language name' do 
    it 'displays the native language city name' do 
      city1 = FactoryGirl.create(:city_with_region_country)
      city2 = FactoryGirl.create(:city_with_region_country)
      assign(:cities, [city1, city2])
      assign(:regions, Region.all)
      assign(:country, city1.region.country)

      render 

      expect(rendered).to have_content city1.native_language_name
      expect(rendered).to have_content city2.native_language_name
    end
  end

end