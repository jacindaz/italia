require 'rails_helper'

describe 'cities/new' do
  context 'when filling out the new city form' do 
    it 'displays the form properly' do 
      city = FactoryGirl.build(:city_with_region_country)
      region = city.region
      assign(:city, city)
      assign(:region, region)
      assign(:country, city.region.country)

      render 

      expect(rendered).to have_content region.english_name
      expect(rendered).to have_content "Is this the Region's capital?"
    end
  end

end