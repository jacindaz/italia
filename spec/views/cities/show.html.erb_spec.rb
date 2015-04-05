require 'rails_helper'

describe 'cities/show' do
  context 'when rendering cities show page' do 
    it 'displays the city description' do 
      city1 = FactoryGirl.create(:city_with_region_country)
      assign(:city, city1)
      assign(:region, city1.region)
      assign(:country, city1.region.country)

      render 

      expect(rendered).to have_content city1.description
    end
  end

end