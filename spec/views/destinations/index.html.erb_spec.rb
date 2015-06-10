require 'rails_helper'

describe 'destinations/index' do
  context 'when the destination object has a title' do 
    it 'displays the title' do 
      destination1 = FactoryGirl.create(:destination_with_address)
      destination2 = FactoryGirl.create(:destination_with_address)
      assign(:destinations, [destination1, destination2])
      assign(:cities, [destination1.address.city, destination2.address.city])

      render 

      expect(rendered).to have_content destination1.english_name
      expect(rendered).to have_content destination2.english_name
    end
  end

end