require 'rails_helper'

describe 'destinations/edit' do
  context 'when editing a new destination form' do 
    it 'displays the form properly' do 
      destination = FactoryGirl.create(:destination_with_address)
      assign(:destination, destination)

      render 

      expect(rendered).to have_selector("form") do |f|
         expect(f).to have_selector("input", :type => "text", :name => "destination[english_name]", :value => destination.english_name )
         expect(f).to have_selector("textarea", :name => "destination[description]", :value => destination.description )
         expect(f).to have_selector("input", :type => "submit")
      end
    end
  end

end