require 'rails_helper'

describe 'destinations/new' do
  context 'when filling out the new destination form' do 
    it 'displays the form properly' do 
      destination = FactoryGirl.build(:destination_no_address)
      assign(:destination, destination)

      render 

      expect(rendered).to have_content "Destination English Name"
      expect(rendered).to have_content "Historic Street"
    end
  end

end