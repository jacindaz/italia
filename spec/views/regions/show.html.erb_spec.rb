require 'rails_helper'

describe 'regions/show' do
  context 'when rendering regions show page' do 
    it 'displays the region description' do 
      region = FactoryGirl.create(:region_with_country)
      assign(:region, region)
      assign(:country, region.country)
      assign(:cities, [FactoryGirl.create(:city_with_region_country)])

      render 

      expect(rendered).to have_content region.description
    end

    it 'displays the cities associated with that region' do 
      region = FactoryGirl.create(:region_with_country)
      city1 = FactoryGirl.create(:city, region: region)
      city2 = FactoryGirl.create(:city, region: region)
      assign(:region, region)
      assign(:country, region.country)
      assign(:cities, [city1, city2])

      render 

      expect(rendered).to have_content city1.native_language_name
      expect(rendered).to have_content city2.native_language_name
    end
  end

end
