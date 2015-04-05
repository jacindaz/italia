require "rails_helper"

RSpec.describe 'destinations/index' do
  context 'when the destination object has a description' do 
    it 'displays the description' do 
      destination1 = FactoryGirl.create(:destination_with_address)
      destination2 = FactoryGirl.create(:destination_with_address)
      assign(:destinations, [destination1, destination2])

      render 

      expect(rendered).to have_content destination1.english_name
      expect(rendered).to have_content destination2.english_name
    end
  end

end