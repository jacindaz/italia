require 'rails_helper'

describe 'destinations/show' do
  context 'when the destination object has a description' do 
    it 'displays the description' do 
      destination1 = FactoryGirl.create(:destination_with_address)
      assign(:destination, destination1)
      assign(:address, destination1.address)
      assign(:city, destination1.address.city)
      assign(:region, destination1.address.city.region)
      assign(:country, destination1.address.city.region.country)

      render 

      expect(rendered).to have_content destination1.description
      expect(rendered).to have_content destination1.hours
    end
  end

end